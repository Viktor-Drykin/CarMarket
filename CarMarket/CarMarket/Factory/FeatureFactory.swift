//
//  FeatureFactory.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import SwiftUI

protocol FeaturesFactoryInterface {
    func makeCarListFeature(router: CarDetailsRoute) -> UIViewController
    func makeCarDetailsFeature(carId: Int) -> UIViewController
}

final class FeaturesFactory: FeaturesFactoryInterface {
    
    let engine: HasServices
    
    init(engine: HasServices) {
        self.engine = engine
    }
    
    func makeCarListFeature(router: CarDetailsRoute) -> UIViewController {
        let viewModel = CarListViewModel(
            carService: engine.carsFetchableService,
            localisationProvider:  engine.localisationEngine.carListLocalisationProvider,
            router: router
        )
        let view = CarListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
    
    func makeCarDetailsFeature(carId: Int) -> UIViewController {
        let viewModel = CarDetailsViewModel(
            carService: engine.carDetailsProvidingService,
            localisationProvider: engine.localisationEngine.carDetailsLocalisationProvider,
            carID: carId
        )
        let view = CarDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
    
}

//enum FeatureFactory {
//    
//    static func carsFeature(router: CarDetailsRoute) -> UIViewController {
//        let networkService = NetworkClient()
//        let carNetworkService = CarNetworkServiceImpl(networkService: networkService)
//        let carService = CarRepositoryImpl(carNetworkService: carNetworkService)
//        let viewModel = CarListViewModel(carService: carService, localisationProvider:  CarListLocalisationProvider(), router: router)
//        let view = CarListView(viewModel: viewModel)
//        let viewController = UIHostingController(rootView: view)
//        return viewController
//    }
//    
//    static func carDetailsFeature(router: DefaultRouter, id: Int) -> UIViewController {
//        //let view = CarDetailsView()
//        //let repo = Repository()
//        //let presenter = Presenter()
//        //return view
//        return UIViewController()
//    }
//}
