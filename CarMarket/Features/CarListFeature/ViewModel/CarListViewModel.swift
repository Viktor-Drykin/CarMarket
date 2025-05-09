//
//  CarListViewModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import Foundation

final class CarListViewModel: ObservableObject {

    @MainActor @Published var isLoading: Bool = true
    @MainActor @Published var infoMessage: String?
    @MainActor @Published var cars: [CarListModel] = []

    private let carService: CarsFetchable
    private let localizationProvider: CarListLocalizationProviding
    private let mapper: CarListMapper
    private let router: CarDetailsRoute

    init(carService: CarsFetchable, localizationProvider: CarListLocalizationProviding, router: CarDetailsRoute) {
        self.carService = carService
        self.localizationProvider = localizationProvider
        self.mapper = CarListMapper(localizationProvider: localizationProvider)
        self.router = router
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
    
    func didTapCarDetails(with id: Int) {
        router.showCarDetails(with: id)
    }
    
    @MainActor private func handleState(cars mappedCars: [CarListModel]) async {
        isLoading = false
        cars = mappedCars
        infoMessage = cars.isEmpty ? localizationProvider.noCarsMessage : nil
    }
    
    @MainActor private func handleState(error: Error) async {
        isLoading = false
        cars = []
        infoMessage = handle(error: error)
    }

    private func handle(error: Error) -> String {
        switch error {
        case CarRepositoryError.invalidRequestData:
            return localizationProvider.invalidRequestDataMessage
        case CarRepositoryError.failedToDecode:
            return localizationProvider.failedToDecodeMessage
        default:
            return localizationProvider.unknownErrorMessage
        }
    }
}
