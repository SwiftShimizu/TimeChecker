//
//  MainViewModel.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/07/31.
//

import Foundation
import RxSwift
import RxCocoa

struct MainViewModel {
    
    // MARK: - Input
    let specifiedDate: AnyObserver<Date>
    let startDate: AnyObserver<Date>
    let endDate: AnyObserver<Date>
    
    // MARK: - Output
    let result: Driver<RangeChecker>
    
    // MARK: - Subject
    private let specifiedDateSubject = BehaviorSubject<Date>(value: Date())
    private let startDateSubject = BehaviorSubject<Date>(value: Date())
    private let endDateSubject =  BehaviorSubject<Date>(value: Date())
    
    // MARK: - Initialize
    init() {
        let rangeResult = Observable.combineLatest(
            specifiedDateSubject,
            startDateSubject,
            endDateSubject
        )
        .map( { (specified, start, end) in
            rangeCheck(specified: specified, start: start, end: end)
        })
        .startWith(.outOfRange)
        
        // input
        self.specifiedDate = self.specifiedDateSubject.asObserver()
        self.startDate = self.startDateSubject.asObserver()
        self.endDate = self.endDateSubject.asObserver()
        
        // output
        self.result = rangeResult.asDriverOnErrorJustComplete()
    }
}
