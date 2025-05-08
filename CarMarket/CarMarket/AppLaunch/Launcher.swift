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
    private var coordinator: CarsCoordinator

    init(window: UIWindow?) {
        self.window = window
        let localisationEngine = LocalizationEngine()
        let engine = Engine(localizationEngine: localisationEngine)
        let featureFactory = FeaturesFactory(engine: engine)
        let navigationController = UINavigationController()
        coordinator = CarsCoordinator(navigationController: navigationController, featureFactory: featureFactory)
        navigationController.setNavigationBarHidden(true, animated: false)
    }

    func start() {
        self.window?.rootViewController = coordinator.rootController
        coordinator.start()
        self.window?.makeKeyAndVisible()
    }
}
