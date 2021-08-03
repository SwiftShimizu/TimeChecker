//
//  UIViewControllerEx.swift
//  TimeRangeChcker
//
//  Created by 志水拓哉 on 2021/08/01.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?,
                   message: String?,
                   yesTitle: String? = "OK",
                   noTitle: String? = nil,
                   cancel: (() -> Void)? = nil,
                   done: (()-> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        if let yesTitle = yesTitle {
            alert.addAction(UIAlertAction(title: yesTitle, style: .default, handler: { _ in
                done?()
            }))
        }
        if let noTitle = noTitle {
            alert.addAction(UIAlertAction(title: noTitle, style: .cancel, handler: { _ in
                cancel?()
            }))
        }
        
        self.present(alert, animated: true)
    }
}

extension UIViewController {
    static var storyboardId: String {
        return self.description().components(separatedBy: ".").dropFirst().joined()
    }
}
