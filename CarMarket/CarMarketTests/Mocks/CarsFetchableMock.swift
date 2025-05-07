//
//  CarsFetchable.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation
@testable import CarMarket

class CarsFetchableMock: CarsFetchable {
    
    var result: Result<[CarRepositoryModel], CarRepositoryError> = .success([])
    
    func fetchCars() async throws -> [CarMarket.CarRepositoryModel] {
        switch result {
        case .success(let models):
            return models
        case .failure(let error):
            throw error
        }
    }
}
