//
//  Color+Hex.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public extension UIColor {    
    convenience init(r: Int, g: Int, b: Int) {
        let red = CGFloat(r)/255
        let green = CGFloat(r)/255
        let blue = CGFloat(r)/255
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
