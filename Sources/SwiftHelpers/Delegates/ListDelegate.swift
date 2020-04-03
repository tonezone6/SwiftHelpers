//
//  CommentsDelegate.swift
//  Delegates
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone6. All rights reserved.
//

import UIKit

public protocol ListPresenting: class {
    func didSelect(row: Int)
}

public class ListDelegate: NSObject, UITableViewDelegate {
    weak var presenting: ListPresenting?
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenting?.didSelect(row: indexPath.row)
    }
}
