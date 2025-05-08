//
//  FeatureFactory.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import SwiftUI

protocol FeaturesFactoryInterface {
    func makeCarListFeature(routes: CarDetailsRoute) -> UIViewController
    func makeCarDetailsFeature(carId: Int) -> UIViewController
}

final class FeaturesFactory: FeaturesFactoryInterface {
    
    let engine: AppDependencies
    
    init(engine: AppDependencies) {
        self.engine = engine
    }
    
    func makeCarListFeature(routes: CarDetailsRoute) -> UIViewController {
        let viewModel = CarListViewModel(
            carService: engine.carsFetchableService,
            localizationProvider:  engine.localizationEngine.carListLocalizationProvider,
            router: routes
        )
        let view = CarListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
    
    func makeCarDetailsFeature(carId: Int) -> UIViewController {
        let viewModel = CarDetailsViewModel(
            carService: engine.carDetailsProvidingService,
            localizationProvider: engine.localizationEngine.carDetailsLocalizationProvider,
            carID: carId
        )
        let view = CarDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
    
}
