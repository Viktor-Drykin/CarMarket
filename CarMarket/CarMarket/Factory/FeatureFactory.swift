//
//  FeatureFactory.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import SwiftUI

enum FeatureFactory {
    
    static func carsFeature(router: CarDetailsRoute) -> UIViewController {
        let networkService = NetworkClient()
        let carNetworkService = CarNetworkServiceImpl(networkService: networkService)
        let carService = CarRepositoryImpl(carNetworkService: carNetworkService)
        let viewModel = CarListViewModel(carService: carService, localisationProvider:  CarListLocalisationProvider(), router: router)
        let view = CarListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
    
    static func carDetailsFeature(router: DefaultRouter, id: Int) -> UIViewController {
        //let view = CarDetailsView()
        //let repo = Repository()
        //let presenter = Presenter()
        //return view
        return UIViewController()
    }
}
