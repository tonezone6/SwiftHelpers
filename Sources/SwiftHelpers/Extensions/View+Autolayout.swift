//
//  View+Autolayout.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public enum Constraint {
    case top        (_ : CGFloat = 0)
    case topSafe    (_ : CGFloat = 0)
    case bottom     (_ : CGFloat = 0)
    case bottomSafe (_ : CGFloat = 0)
    case left       (_ : CGFloat = 0)
    case right      (_ : CGFloat = 0)
    case centerX
    case centerY
}

public extension Constraint {
    static var fill:     [Constraint] { [.top(), .bottom(), .left(), .right()] }
    static var fillSafe: [Constraint] { [.topSafe(), .bottomSafe(), .left(), .right()] }
    static var center:   [Constraint] { [.centerX, .centerY] }
}

public extension Constraint {
    func map(_ child: UIView, _ parent: UIView) -> NSLayoutConstraint {
        switch self {
        case .top(let inset):
            return child.topAnchor.constraint(
                equalTo: parent.topAnchor, constant: inset)
        
        case .topSafe(let inset):
            return child.topAnchor.constraint(
                equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: inset)
       
        case .bottom(let inset):
            return child.bottomAnchor.constraint(
                equalTo: parent.bottomAnchor, constant: -inset)
            
        case .bottomSafe(let inset):
            return child.bottomAnchor.constraint(
                equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -inset)
        
        case .left(let inset):
            return child.leftAnchor.constraint(
                equalTo: parent.leftAnchor, constant: inset)
        
        case .right(let inset):
            return child.rightAnchor.constraint(
                equalTo: parent.rightAnchor, constant: -inset)
        
        case .centerX:
            return child.centerXAnchor.constraint(
                equalTo: parent.centerXAnchor)
        
        case .centerY:
            return child.centerYAnchor.constraint(
                equalTo: parent.centerYAnchor)
        }
    }
}

public extension UIView {
    func addSubview(_ child: UIView, constraints: [Constraint]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0.map(child, self) })
    }
}
