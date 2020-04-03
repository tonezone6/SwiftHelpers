//
//  Storyboard.swift
//  P2PKitApp
//
//  Created by Alex on 30/03/2020.
//  Copyright © 2020 Udevoffice. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    func instantiate<T: UIViewController>(_ viewController: T.Type) -> T {
        let identifier = String(describing: viewController)
        guard let instance = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError()
        }
        return instance
    }
}
