//
//  CarDetailsViewModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import Foundation

final class CarDetailsViewModel: ObservableObject {

    @MainActor @Published var carDetailsModel: CarDetailsModel?
    @MainActor @Published var message: String?

    private let carService: CarDetailsProviding
    private let localizationProvider: CarDetailsLocalizationProviding
    private let mapper: CarDetailsMapper
    private let carID: Int

    init(carService: CarDetailsProviding,
         localizationProvider: CarDetailsLocalizationProviding,
         carID: Int) {
        self.carService = carService
        self.localizationProvider = localizationProvider
        self.mapper = CarDetailsMapper(localizationProvider: localizationProvider)
        self.carID = carID
    }

    func loadCars() async {
        let fetchedCar = await carService.carDetails(by: carID)
        guard let fetchedCar else {
            await handleEmptyState()
            return
        }
        let model = mapper.map(model: fetchedCar)
        await handleState(model: model)
    }
    
    @MainActor private func handleEmptyState() async {
        message = localizationProvider.noDetails
        carDetailsModel = nil
    }
    
    @MainActor private func handleState(model: CarDetailsModel) async {
        message = nil
        carDetailsModel = model
    }
}
