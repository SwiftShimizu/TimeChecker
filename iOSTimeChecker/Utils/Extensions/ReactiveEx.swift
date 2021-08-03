//
//  ReactiveEx.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import UIKit
import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Bool> {
        let events = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
        return ControlEvent(events: events)
    }
}

extension Reactive where Base: UILabel {
    public var rangeResult: Binder<RangeChecker> {
        return Binder(base) { label, result in
            label.text = result.description
        }
    }
}

