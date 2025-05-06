//
//  CarServiceInterface.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

protocol CarsFetchable {
    func fetchCars() async throws -> [CarServiceModel]
}

protocol CarDetailsProviding {
    func carDetails(by id: Int) async throws -> CarServiceModel?
}
