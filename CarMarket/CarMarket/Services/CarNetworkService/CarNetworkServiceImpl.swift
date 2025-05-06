//
//  CarNetworkServiceImpl.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import Foundation

final class CarNetworkServiceImpl {

    private let urlPath = "https://private-fe87c-simpleclassifieds.apiary-mock.com/"
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension CarNetworkServiceImpl: CarNetworkService {

    func fetchCars() async throws -> [Response.Car] {

        guard let url = URL(string: urlPath) else {
            throw CarNetworkServiceError.incorrectURL
        }

        let request = URLRequest(url: url)

        do {
            let cars: [Response.Car] = try await networkService.perform(urlRequest: request)
            guard !cars.isEmpty else {
                throw CarNetworkServiceError.empty
            }
            return cars
        } catch NetworkError.failedToDecode {
            throw CarNetworkServiceError.failedToDecode
        } catch NetworkError.invalidStatusCode {
            throw CarNetworkServiceError.invalidStatusCode
        }
    }
}
