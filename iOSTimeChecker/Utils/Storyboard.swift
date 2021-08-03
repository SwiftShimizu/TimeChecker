//
//  Storyboard.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import Foundation
import UIKit

enum Storyboard: String {
    
    case Result
    
    func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        if let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateViewController(withIdentifier: VC.storyboardId) as? VC {
            return vc
        } else {
             fatalError("ストーリボードのインスタンスに失敗")
        }
    }
}
