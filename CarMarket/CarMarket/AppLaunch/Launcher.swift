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
    private let navigationController: UINavigationController
    private var router: DefaultRouter

    init(window: UIWindow?) {
        self.window = window
        let engine = Engine()
        let featureFactory = FeaturesFactory(engine: engine)
        router = DefaultRouter(rootTransition: EmptyTransition(), featureFactory: featureFactory)
        navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
    }

    func start() {
        let carListViewController = router.makeCarList()
        navigationController.viewControllers = [carListViewController]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
