//
//  Engine.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

final class Engine {
    
    let localizationEngine: LocalizationProviding

    var carsFetchableService: CarsFetchable { carService }
    var carDetailsProvidingService: CarDetailsProviding { carService }
    
    private let networkService: NetworkService = NetworkClient()
    private lazy var carNetworkService: CarNetworkService = CarNetworkServiceImpl(networkService: networkService)
    private lazy var carService: CarsFetchable & CarDetailsProviding = CarRepositoryImpl(carNetworkService: carNetworkService)
    
    init(localizationEngine: LocalizationProviding) {
        self.localizationEngine = localizationEngine
    }
}

extension Engine: AppDependencies {}

typealias AppDependencies = (
    HasLocalizationEngine &
    HasCarsFetchableService &
    HasCarDetailsProvidingService
)

protocol HasLocalizationEngine {
    var localizationEngine: LocalizationProviding { get }
}

protocol HasCarsFetchableService {
    var carsFetchableService: CarsFetchable { get }
}

protocol HasCarDetailsProvidingService {
    var carDetailsProvidingService: CarDetailsProviding { get }
}
