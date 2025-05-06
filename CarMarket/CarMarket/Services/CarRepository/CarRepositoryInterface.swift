//
//  CarServiceInterface.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

protocol CarsFetchable {
    func fetchCars() async throws -> [CarRepositoryModel]
}

protocol CarDetailsProviding {
    func carDetails(by id: Int) async -> CarRepositoryModel?
}
