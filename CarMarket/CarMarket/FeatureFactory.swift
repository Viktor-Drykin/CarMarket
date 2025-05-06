//
//  FeatureFactory.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//


import SwiftUI

enum FeatureFactory {
    
    static func carsFeature() -> some View {
        let networkService = NetworkClient()
        let carNetworkService = CarNetworkServiceImpl(networkService: networkService)
        let carService = CarServiceImpl(carNetworkService: carNetworkService)
        let viewModel = CarListViewModel(carService: carService, localisationProvider:  CarListLocalisationProvider())
        let view = CarListView(viewModel: viewModel)
        return view
    }
    
    static func carDetailsFeature() {
        //let view = CarDetailsView()
        //let repo = Repository()
        //let presenter = Presenter()
        //return view
    }
}
