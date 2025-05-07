//
//  CarsFetchable.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

class CarsFetchableMock: CarsFetchable {
    
    var result: Result<[CarRepositoryModel], CarRepositoryError> = .success([CarRepositoryModelBuilder().build()])
    
    func fetchCars() async throws -> [CarMarket.CarRepositoryModel] {
        switch result {
        case .success(let models):
            return models
        case .failure(let error):
            throw error
        }
    }
}
