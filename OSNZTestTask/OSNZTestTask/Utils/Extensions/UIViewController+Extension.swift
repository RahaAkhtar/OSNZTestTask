//
//  UIViewController+Extension.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import UIKit

extension UIViewController {
    
    func alertMessageShow(message: String) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: {
                        _ in
                    return
        }))
            self.present(alert, animated: true, completion: nil)
        
    }
}
