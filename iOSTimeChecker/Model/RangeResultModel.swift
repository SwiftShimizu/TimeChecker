//
//  RangeResultModel.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import RealmSwift
import Foundation

@objcMembers
final class RangeResultModel: Object {
    @objc dynamic var specifiedStringDate: String = ""
    @objc dynamic var startDateStringDate: String = ""
    @objc dynamic var endDateStringDate: String = ""
    @objc dynamic var result: String = ""
    
    required override init() {
        super.init()
    }
    
    init(specified: String, start: String, end: String, result: String) {
        self.specifiedStringDate = specified
        self.startDateStringDate = start
        self.endDateStringDate = end
        self.result = result
    }
}
