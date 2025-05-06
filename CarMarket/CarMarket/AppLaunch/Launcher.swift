//
//  Launcher.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import UIKit
import SwiftUI

final class Launcher {
    
    private let window: UIWindow?
    private let navigationController : UINavigationController?
    private let router: CarListRoute

    init(window: UIWindow?, router: CarListRoute) {
        self.window = window
        self.router = router
        navigationController = UINavigationController()
    }

    func start() {
        let carListViewController = router.makeCarList()
        navigationController?.viewControllers = [carListViewController]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
