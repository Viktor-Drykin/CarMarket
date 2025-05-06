//
//  CarServiceMock.swift
//  CarMarket
//
//  Created by Viktor Drykin on 20.12.2024.
//

@testable import CarMarket

class CarServiceMock: CarService {

    var result: Result<[CarMarket.Response.Car], Error> = .success([Response.CarBuilder().build()])

    func fetchCars() async throws -> [CarMarket.Response.Car] {
        switch result {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        }
    }
}
