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
        let viewController = featureFactory.makeCarDetailsFeature(carId: id)
        route(to: viewController, as: transition)
    }
    
    func showCarDetails(with id: Int) {
        makeCarDetails(with: ModalTransition(), id: id)
    }
}

extension DefaultRouter: CarDetailsRoute {}
