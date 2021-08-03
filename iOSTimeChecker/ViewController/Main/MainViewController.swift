//
//  MainViewController.swift
//  TimeRangeChcker
//
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var specifiedDate: UIDatePicker!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        let dateArray = [
            self.specifiedDate.date,
            self.startDate.date,
            self.endDate.date
        ]
        
        let dateFormatter = DateFormatter()
        dateFormatter.japaneseLocalized(dateFormat: "HH:mm")
        
        var params = [String]()
        dateArray.forEach { date in
            params.append(dateFormatter.string(from: date))
        }
        params.append(self.resultLabel.text ?? "指定時間外です")
        let model = RangeResultModel(specified: params[0],
                                     start: params[1],
                                     end: params[2],
                                     result: params[3])
        
        RealmManager.shared.updateResult(results: model) {
            self.showAlert(title: "",
                           message: "保存に成功しました",
                           yesTitle: "OK",
                           noTitle: nil,
                           cancel: nil) { [weak self] in
                self?.dismiss(animated: false)
            }
        }
    }
    
    @IBAction func didTapPresentResultView(_ sender: Any) {
        let vc = ResultViewController.configureViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

private extension MainViewController {
    func bindViewModel() {
        self.specifiedDate.rx.value.changed
            .bind(to: self.viewModel.specifiedDate)
            .disposed(by: self.disposeBag)
        
        self.startDate.rx.value.changed
            .bind(to: self.viewModel.startDate)
            .disposed(by: self.disposeBag)
        
        self.endDate.rx.value.changed
            .bind(to: self.viewModel.endDate)
            .disposed(by: self.disposeBag)
        
        self.viewModel.result
            .drive(self.resultLabel.rx.rangeResult)
            .disposed(by: self.disposeBag)
    }
}

