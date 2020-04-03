//
//  TableViewDataSource.swift
//  Data sources
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public class ListDataSource<Item>: NSObject, UITableViewDataSource {
    private var cellClass: UITableViewCell.Type
    private var items: [Item]
    private var configure: (UITableViewCell, Item) -> ()
    private var registered = false

    public init<C: UITableViewCell>(cell: C.Type,
                                    items: [Item],
                                    configure: @escaping (C, Item) -> ()) {
        
        self.items = items
        self.cellClass = cell
        self.configure = { cell, comment in
            configure(cell as! C, comment)
        }
    }
    
    public func item(at position: Int) -> Item { items[position] }
        
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !registered {
            tableView.register(cellClass, forCellReuseIdentifier: cellClass.identifier)
            registered = true
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath)
        let item = items[indexPath.row]
        
        configure(cell, item)
    
        return cell
    }
}
