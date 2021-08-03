//
//  ResultTabeViewCell.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import UIKit

class ResultTabeViewCell: UITableViewCell {
    
    @IBOutlet weak var specifiedDateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    static let identifier = "ResultTabeViewCell"
    var content: RangeResultModel? {
        didSet {
            self.setupUI(content ?? RangeResultModel(specified: "登録なし",
                                                     start: "登録なし",
                                                     end: "登録なし",
                                                     result: "登録なし"))
        }
    }
    
    private func setupUI(_ content: RangeResultModel) {
        self.specifiedDateLabel.text = content.specifiedStringDate
        self.startDateLabel.text = content.startDateStringDate
        self.endDateLabel.text = content.endDateStringDate
        self.resultLabel.text = content.result
    }
}
