//
//  RealmManager.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import Foundation
import RealmSwift
import RxSwift

final class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    private let realm = try! Realm()
    
    func updateResult(results: RangeResultModel, comletion: () -> ()) {
        try! self.realm.write {
            self.realm.add(results)
            comletion()
        }
    }
    
    func loadResult() -> [RangeResultModel] {
        Array(self.realm.objects(RangeResultModel.self))
    }
}
