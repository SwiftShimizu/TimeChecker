//
//  RangeChecker.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/07/31.
//

import Foundation
import RxSwift
import RxCocoa

public enum RangeChecker {
    case inRange
    case outOfRange
    case error(message: String)
}

public enum RangeTarget: String {
    
    case hour
    
    var dataFormatter: String {
        switch self {
        case .hour:
            return "HH"
        }
    }
}

public func rangeCheck(specified: Date,
                       start: Date,
                       end: Date,
                       range: RangeTarget = .hour) -> RangeChecker {
    
    let dateFormatter = DateFormatter()
    dateFormatter.japaneseLocalized(dateFormat: range.dataFormatter)
    
    let specifiedObj = dateFormatter.string(from: specified)
    let startObj = dateFormatter.string(from: start)
    let endObj = dateFormatter.string(from: end)
    
    var specifiedInt = Int(specifiedObj) ?? .zero
    let startInt = Int(startObj) ?? .zero
    var endInt = Int(endObj) ?? .zero
   
    // 開始時間が終了時間を上回っていた場合、日を跨いでいるため24時間をプラスして処理する
    if range == .hour && endInt < startInt {
        endInt += 24
        specifiedInt += 24
        if endInt - specifiedInt < 0 {
            specifiedInt -= 24
        }
    }
    
    if startInt == endInt && startInt == specifiedInt {
        return .inRange
    }
    
    if startInt..<endInt  ~= specifiedInt {
        return .inRange
    } else {
        return .outOfRange
    }
}

extension RangeChecker: CustomStringConvertible {
    public var description: String {
        switch self {
        case .inRange:
            return "指定時間内です"
        case .outOfRange:
            return "指定時間外です"
        case let .error(message: message):
            return message
        }
    }
}
