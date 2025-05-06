//
//  CarDetailsViewModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import Foundation

final class CarDetailsViewModel {

    @MainActor @Published var carDetailsModel: CarDetailsModel?

    private let carService: CarDetailsProviding
    private let localisationProvider: CarDetailsLocalisationProvider
    private let mapper: CarDetailsMapper
    //TODO: should it be a transfer object?
    private let carID: Int

    init(carService: CarDetailsProviding, localisationProvider: CarDetailsLocalisationProvider, carID: Int) {
        self.carService = carService
        self.localisationProvider = localisationProvider
        self.mapper = CarDetailsMapper(localisationProvider: localisationProvider)
        self.carID = carID
    }

    func loadCars() async {
            let fetchedCar = await carService.carDetails(by: carID)
            //TODO: remove !
            let model = mapper.map(domainModel: fetchedCar!)
            await handleState(model: model)
    }
    
    @MainActor private func handleState(model: CarDetailsModel) async {
        carDetailsModel = carDetailsModel
    }
}
