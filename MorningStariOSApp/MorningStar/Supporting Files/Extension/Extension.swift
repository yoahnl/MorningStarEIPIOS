//
//  Extension.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 12/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    static let error = Notification.Name("error")
}

extension UIViewController {
    
    func displayAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    @objc func displayError(notification :Notification) {
        guard let dataError = notification.object as? [String] else {
            return
        }
        self.displayAlert(title: dataError[0], message: dataError[1])
    }
}
