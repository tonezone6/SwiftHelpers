//
//  ScrollView+Keyboard.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public protocol KeyboardObserving {
    func observe()
    func tapOutsideToDismiss()
}

extension UIScrollView: KeyboardObserving {
    public var keyboard: KeyboardObserving { return self }
    
    public func observe() {
        let center = NotificationCenter.default
        
        center.addObserver(
            self, selector: #selector(didReceive(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
        
        center.addObserver(
            self, selector: #selector(didReceive(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    public func tapOutsideToDismiss() {
        let tap = UITapGestureRecognizer()
        addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(userDidTap(sender:)))
    }
    
    @objc private func userDidTap(sender: UITapGestureRecognizer) {
        endEditing(true)
    }
    
    @objc private func didReceive(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardValue.cgRectValue
        let inset = keyboardFrame.height - safeAreaInsets.bottom + 8.0 // extra inset
        contentInset.bottom = (notification.name == UIResponder.keyboardWillHideNotification) ? .zero : inset
        scrollIndicatorInsets = contentInset
    }
}
