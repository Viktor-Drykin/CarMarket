//
//  CarDetailsViewModelTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 08.05.2025.
//

import XCTest
@testable import CarMarket

@MainActor
final class CarDetailsViewModelTests: XCTestCase {

    var sut: CarDetailsViewModel!
    var service: CarDetailsProvidingMock!
    var localization: CarDetailsLocalizationProviderMock!

    override func setUp() {
        super.setUp()
        service = CarDetailsProvidingMock()
        localization = CarDetailsLocalizationProviderMock()
    }

    func test_loadCars_whenCarIsAvailable_setCarDetailsModel() async {
        // Given
        service.result = CarRepositoryModelBuilder()
            .build()
        sut = CarDetailsViewModel(carService: service, localizationProvider: localization, carID: 1)

        // When
        await sut.loadCars()

        // Then
        XCTAssertNil(sut.message)
        XCTAssertNotNil(sut.carDetailsModel)
    }

    func test_loadCars_whenCarIsUnavailable_setErrorMessage() async {
        // Given
        service.result = nil
        sut = CarDetailsViewModel(carService: service, localizationProvider: localization, carID: 1)

        // When
        await sut.loadCars()

        // Then
        XCTAssertEqual(sut.message, "No details")
        XCTAssertNil(sut.carDetailsModel)
    }
}
