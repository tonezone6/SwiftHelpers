//
//  Coordinator.swift
//  Protocols
//
//  Created by tonezone on 16/02/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
