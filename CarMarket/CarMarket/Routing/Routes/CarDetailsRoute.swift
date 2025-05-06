//
//  CarDetailsRoute.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import UIKit
import SwiftUI

protocol CarDetailsRoute {
    func showCarDetails(with id: Int)
}

extension CarDetailsRoute where Self: Router {
    func makeCarDetails(with transition: Transition, id: Int) {
        let router = DefaultRouter(rootTransition: transition)
        
        
        //let viewModel = LoginViewModel(router: router)
        //let viewController = LoginViewController(viewModel: viewModel)
        //let navigationController = UINavigationController(rootViewController: viewController)
        let viewController = FeatureFactory.carDetailsFeature(router: router, id: id)
        viewController.view.backgroundColor = .yellow
//        router.root = viewController

        route(to: viewController, as: transition)
    }
    
    func showCarDetails(with id: Int) {
        makeCarDetails(with: PushTransition(), id: id)
    }
}

extension DefaultRouter: CarDetailsRoute {}
