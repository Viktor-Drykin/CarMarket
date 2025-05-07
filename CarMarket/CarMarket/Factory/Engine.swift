//
//  Engine.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

final class Engine {
    
    private let networkService: NetworkService = NetworkClient()
    
    let localisationEngine = LocalizationEngine(locale: .current)
    lazy var carNetworkService: CarNetworkService = CarNetworkServiceImpl(networkService: networkService)
    lazy var carService: CarsFetchable & CarDetailsProviding = CarRepositoryImpl(carNetworkService: carNetworkService)
    
    var carsFetchableService: CarsFetchable { carService }
    var carDetailsProvidingService: CarDetailsProviding { carService }
}

extension Engine: HasServices {}

typealias HasServices = (
    HasLocalizationEngine &
    HasCarsFetchableService &
    HasCarDetailsProvidingService
)

protocol HasLocalizationEngine {
    var localisationEngine: LocalizationEngine { get }
}

protocol HasCarsFetchableService {
    var carsFetchableService: CarsFetchable { get }
}

protocol HasCarDetailsProvidingService {
    var carDetailsProvidingService: CarDetailsProviding { get }
}
