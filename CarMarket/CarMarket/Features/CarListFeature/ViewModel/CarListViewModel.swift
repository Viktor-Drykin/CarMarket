//
//  CarListViewModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import Foundation

final class CarListViewModel: ObservableObject {

    @MainActor @Published var infoMessage: String?
    @MainActor @Published var cars: [CarListModel] = []

    private let carService: CarsFetchable
    private let localisationProvider: CarListLocalisationProvider
    private let mapper: CarMapper

    init(carService: CarsFetchable, localisationProvider: CarListLocalisationProvider) {
        self.carService = carService
        self.localisationProvider = localisationProvider
        self.mapper = CarMapper(localisationProvider: localisationProvider)
    }

    func loadCars() async {
        do {
            let foundCars = try await carService.fetchCars()
            let mappedCars = mapper.map(response: foundCars)
            await handleState(cars: mappedCars)
        } catch {
            await handleState(error: error)
        }
    }
    
    @MainActor private func handleState(cars mappedCars: [CarListModel]) async {
        cars = mappedCars
        infoMessage = nil
    }
    
    @MainActor private func handleState(error: Error) async {
        cars = []
        infoMessage = handle(error: error)
    }

    private func handle(error: Error) -> String {
        switch error {
        case CarServiceError.empty:
            return localisationProvider.noCarsMessage
        case CarServiceError.invalidRequestData:
            return localisationProvider.invalidRequestDataMessage
        case CarServiceError.failedToDecode:
            return localisationProvider.failedToDecodeMessage
        default:
            return localisationProvider.unknownErrorMessage
        }
    }
}
