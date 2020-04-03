//
//  WindowConfigurartor.swift
//  WeatherApp
//
//  Created by tonezone on 16/02/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

public struct WindowConfigurator {
    private(set) var window: UIWindow
        
    public init(coordinator: Coordinator) {
        window = UIWindow()
        window.frame = coordinator.navigationController.view.bounds
        window.rootViewController = coordinator.navigationController
        window.makeKeyAndVisible()
        
        coordinator.start()
    }
        
    @available(iOS 13.0, *)
    public init?(scene: UIScene, coordinator: Coordinator) {
        guard let wscene = scene as? UIWindowScene else { return nil }

        window = UIWindow(windowScene: wscene)
        window.frame = wscene.coordinateSpace.bounds
        window.rootViewController = coordinator.navigationController
        window.makeKeyAndVisible()
        
        coordinator.start()
    }
}
