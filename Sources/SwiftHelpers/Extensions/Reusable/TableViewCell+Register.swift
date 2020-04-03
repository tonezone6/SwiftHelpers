//
//  TableViewCell+Reuse.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

public extension UITableView {
    func register<A: UITableViewCell>(_ cell: A.Type) {
        register(A.self, forCellReuseIdentifier: A.identifier)
    }
    
    func register<A: UITableViewCell>(nib: A.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: A.identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: A.identifier)
    }
    
    func dequeueReusableCell<A: UITableViewCell>(_ type: A.Type, for indexPath: IndexPath) -> A? {
        dequeueReusableCell(withIdentifier: A.identifier, for: indexPath) as? A
    }
}
