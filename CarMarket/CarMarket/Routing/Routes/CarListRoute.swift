//
//  CarListRoute.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import UIKit
import SwiftUI

protocol CarListRoute {
    func makeCarList() -> UIViewController
}

extension CarListRoute where Self: Router {
    
    func makeCarList() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = FeatureFactory.carsFeature(router: router)
        router.root = viewController
        return viewController
    }
}

extension DefaultRouter: CarListRoute {}
