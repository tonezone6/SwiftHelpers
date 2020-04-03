//
//  CollectionViewCell+Reuse.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

public extension UICollectionView {
    func register<A: UICollectionViewCell>(cellType: A.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: A.identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: A.identifier)
    }
    
    func dequeueReusableCell<A: UICollectionViewCell>(type: A.Type, for indexPath: IndexPath) -> A? {
        dequeueReusableCell(withReuseIdentifier: A.identifier, for: indexPath) as? A
    }
}
