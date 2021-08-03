//
//  ResultViewController.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import UIKit
import RxSwift
import RxCocoa

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = ResultViewModel()
    private var resultContents: [RangeResultModel]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bindViewModel()
        self.viewModel.viewWillAppear.onNext(())
    }
    
    static func configureViewController() -> UIViewController {
        let vc = Storyboard.Result.instantiate(ResultViewController.self)
        return vc
    }
}

private extension ResultViewController {
   
    func bindViewModel() {
        rx.viewWillAppear.mapToVoid()
            .bind(to: self.viewModel.viewWillAppear)
            .disposed(by: self.disposeBag)
        
        self.viewModel.resultContents
            .drive(onNext: { [weak self] result in
                self?.resultContents = result
            })
            .disposed(by: self.disposeBag)
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.resultContents?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTabeViewCell.identifier, for: indexPath) as! ResultTabeViewCell
        let content = self.resultContents?[indexPath.row]
        cell.content = content
        return cell
    }
    
}
