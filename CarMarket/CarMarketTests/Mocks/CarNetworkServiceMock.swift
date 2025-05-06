//
//  CarNetworkServiceMock.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation
@testable import CarMarket

final class CarNetworkServiceMock: CarNetworkService {
    var result: Result<[Response.Car], CarNetworkServiceError> = .success([Response.CarBuilder().build()])
    
    func fetchCars() async throws -> [Response.Car] {
        switch result {
        case .success(let cars):
            return cars
        case .failure(let error):
            throw error
        }
    }
}
