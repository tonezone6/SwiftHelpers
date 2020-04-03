//
//  TableHeaderFooterView+Reuse.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public extension UITableViewHeaderFooterView {
    static var identifier: String {
        String(describing: self)
    }
}

public extension UITableView {
    func register<A: UITableViewHeaderFooterView>(headerFooterType: A.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: A.identifier, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: A.identifier)
    }
    
    func dequeueReusableHeaderFooter<A: UITableViewHeaderFooterView>(viewType: A.Type) -> A? {
        dequeueReusableHeaderFooterView(withIdentifier: A.identifier) as? A
    }
}
