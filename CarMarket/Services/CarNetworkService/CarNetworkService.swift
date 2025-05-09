//
//  CarNetworkService.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

protocol CarNetworkService: AnyObject {
    func fetchCars() async throws -> [Response.Car]
}
