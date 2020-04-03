//
//  TaggedFieldDelegate.swift
//  Delegates
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public class TaggedFieldDelegate: NSObject, UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
    
        if let nextField = textField.superview?.viewWithTag(nextTag) {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
