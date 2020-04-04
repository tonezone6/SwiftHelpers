//
//  File.swift
//  
//
//  Created by Alex on 04/04/2020.
//

import UIKit

public extension UIViewController {
    func presentAlert(title: String = "Alert!", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func presentInputAlert(
        title: String? = nil, subtitle: String? = nil,
        actionTitle: String? = "Add", cancelTitle: String? = "Cancel",
        inputPlaceholder: String? = nil,
        defaultText: String? = nil,
        inputKeyboardType: UIKeyboardType = .default,
        cancelHandler: ((UIAlertAction) -> Void)? = nil,
        actionHandler: ((String?) -> Void)? = nil) {

            let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
            alert.addTextField { input in
                input.placeholder = inputPlaceholder
                input.keyboardType = inputKeyboardType
                input.text = defaultText
            }
            
            let main = UIAlertAction(title: actionTitle, style: .destructive, handler: { action in
                guard let inputField =  alert.textFields?.first else {
                    actionHandler?(nil)
                    return
                }
                actionHandler?(inputField.text)
            })
        
            let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
    
            alert.addAction(main)
            alert.addAction(cancel)

            present(alert, animated: true, completion: nil)
        }
}

