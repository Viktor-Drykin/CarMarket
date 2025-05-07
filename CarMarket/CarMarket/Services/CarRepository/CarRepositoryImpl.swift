//
//  CarRepositoryImpl.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

final class CarRepositoryImpl {
    
    private let carNetworkService: CarNetworkService
    private var carModels: [CarRepositoryModel] = []
    
    init(carNetworkService: CarNetworkService) {
        self.carNetworkService = carNetworkService
    }
}

extension CarRepositoryImpl: CarsFetchable {
    
    func fetchCars() async throws -> [CarRepositoryModel] {
        do {
            let responseCars = try await carNetworkService.fetchCars()
            carModels = responseCars.map { .init(with: $0) }
            return carModels
        } catch CarNetworkServiceError.failedToDecode {
            throw CarRepositoryError.failedToDecode
        } catch CarNetworkServiceError.invalidStatusCode {
            throw CarRepositoryError.invalidRequestData
        } catch CarNetworkServiceError.incorrectURL {
            throw CarRepositoryError.invalidRequestData
        } catch {
            throw CarRepositoryError.unknown
        }
    }
}

extension CarRepositoryImpl: CarDetailsProviding {
    func carDetails(by id: Int) async -> CarRepositoryModel? {
        carModels.first(where: { $0.id == id })
    }
}
