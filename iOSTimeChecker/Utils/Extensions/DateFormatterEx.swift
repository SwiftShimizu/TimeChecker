//
//  DateFormatterEx.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import UIKit

extension DateFormatter {
    func japaneseLocalized(dateFormat: String) {
        self.calendar = Calendar(identifier: .gregorian)
        self.timeZone = TimeZone(identifier: "Asia/Tokyo")
        self.dateFormat = dateFormat
        self.locale = Locale(identifier: "ja_JP")
    }
}
