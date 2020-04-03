//
//  CollectionReusableView+Register.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func register<A: UICollectionReusableView>(footerType: A.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: String(describing: A.self), bundle: bundle)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: A.self))
    }
    
    func dequeueReusableSupplementaryView<A: UICollectionReusableView>(type: A.Type, kind: String, indexPath: IndexPath) -> A? {
        let id = String(describing: A.self)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: indexPath) as? A
    }
}
