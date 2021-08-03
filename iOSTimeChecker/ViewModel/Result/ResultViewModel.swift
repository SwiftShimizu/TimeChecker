//
//  ResultViewModel.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import Foundation
import RxSwift
import RxCocoa

struct ResultViewModel {
    // MARK: - Input
    let viewWillAppear: AnyObserver<Void>
    
    // MARK: - Output
    let resultContents: Driver<[RangeResultModel]>
    
    // MARK: - Subject
    private let viewWillAppearSubject = PublishSubject<Void>()
    
    init() {
        let fetchResultContents = viewWillAppearSubject.map { _ in
            RealmManager.shared.loadResult()
        }
        
        // input
        self.viewWillAppear = viewWillAppearSubject.asObserver()
        
        // output
        self.resultContents = fetchResultContents.asDriverOnErrorJustComplete()
    }
}
