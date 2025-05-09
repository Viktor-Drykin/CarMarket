//
//  CarListCoordinator.swift
//  CarMarket
//
//  Created by Viktor Drykin on 08.05.2025.
//
import UIKit
import SwiftUI

final class CarsCoordinator {
    
    var rootController: UIViewController { navigationController }
    
    private let navigationController: UINavigationController
    private let featureFactory: FeaturesFactoryInterface

    init(
        navigationController: UINavigationController,
        featureFactory: FeaturesFactoryInterface
    ) {
        self.navigationController = navigationController
        self.featureFactory = featureFactory
    }

    func start() {
        let viewController = featureFactory.makeCarListFeature(routes: self)
        navigationController.viewControllers = [viewController]
    }
}

extension CarsCoordinator: CarDetailsRoute {
    func showCarDetails(with id: Int) {
        let viewController = featureFactory.makeCarDetailsFeature(carId: id)
        navigationController.present(viewController, animated: true)
    }
}
