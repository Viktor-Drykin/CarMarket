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

//TODO: Do I need this protocol?
extension CarRepositoryImpl: CarDetailsProviding {
    func carDetails(by id: Int) async -> CarRepositoryModel? {
        carModels.first(where: { $0.id == id })
    }
}

extension CarRepositoryModel {
    init(with response: Response.Car) {
        self.init(
            id: response.id,
            make: response.make,
            model: response.model,
            price: response.price,
            firstRegistration: response.firstRegistration,
            mileage: response.mileage,
            fuel: response.fuel,
            imageStrings: response.images?.map { $0.url },
            description: response.description,
            modelline: response.modelline,
            seller: .init(with: response.seller)
        )
    }
}

extension CarRepositoryModel.Seller {
    init?(with response: Response.Seller?) {
        guard let response else { return nil }
        self.type = response.type
        self.phone = response.phone
        self.city = response.city
    }
}
