//
//  CarDetailsViewModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import Foundation

final class CarDetailsViewModel {

    @MainActor @Published var carDetailsModel: CarDetailsModel?
    @MainActor @Published var message: String?

    private let carService: CarDetailsProviding
    private let localisationProvider: CarDetailsLocalisationProvider
    private let mapper: CarDetailsMapper
    private let carID: Int

    init(carService: CarDetailsProviding, localisationProvider: CarDetailsLocalisationProvider, carID: Int) {
        self.carService = carService
        self.localisationProvider = localisationProvider
        self.mapper = CarDetailsMapper(localisationProvider: localisationProvider)
        self.carID = carID
    }

    func loadCars() async {
        let fetchedCar = await carService.carDetails(by: carID)
        guard let fetchedCar else {
            await handleEmptyState()
            return
        }
        let model = mapper.map(domainModel: fetchedCar)
        await handleState(model: model)
    }
    
    @MainActor private func handleEmptyState() async {
        message = localisationProvider.noDetails
        carDetailsModel = nil
    }
    
    @MainActor private func handleState(model: CarDetailsModel?) async {
        message = nil
        carDetailsModel = carDetailsModel
    }
}
