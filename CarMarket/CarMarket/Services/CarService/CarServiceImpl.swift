//
//  CarServiceImpl.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

final class CarServiceImpl {
    
    private let carNetworkService: CarNetworkService
    private var carModels: [CarServiceModel] = []
    
    init(carNetworkService: CarNetworkService) {
        self.carNetworkService = carNetworkService
    }
}

extension CarServiceImpl: CarsFetchable {
    
    func fetchCars() async throws -> [CarServiceModel] {
        do {
            let responseCars = try await carNetworkService.fetchCars()
            carModels = responseCars.map { .init(with: $0) }
            return carModels
        } catch CarNetworkServiceError.failedToDecode {
            throw CarServiceError.failedToDecode
        } catch CarNetworkServiceError.invalidStatusCode {
            throw CarServiceError.invalidRequestData
        } catch CarNetworkServiceError.incorrectURL {
            throw CarServiceError.invalidRequestData
        } catch CarNetworkServiceError.empty {
            throw CarServiceError.empty
        } catch {
            throw CarServiceError.unknown
        }
    }
}

//TODO: Do I need this protocol?
extension CarServiceImpl: CarDetailsProviding {
    func carDetails(by id: Int) async throws -> CarServiceModel? {
        carModels.first(where: { $0.id == id })
    }
}

extension CarServiceModel {
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

extension CarServiceModel.Seller {
    init?(with response: Response.Seller?) {
        guard let response else { return nil }
        self.type = response.type
        self.phone = response.phone
        self.city = response.city
    }
}
