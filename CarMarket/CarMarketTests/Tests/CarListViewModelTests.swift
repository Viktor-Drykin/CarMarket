//
//  CarListViewModelTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//

import XCTest
@testable import CarMarket

@MainActor
final class CarListViewModelTests: XCTestCase {

    private var carService: CarsFetchableMock!
    private var localization: CarListLocalizationProviderMock!
    private var router: CarDetailsRouterSpy!
    private var sut: CarListViewModel!

    override func setUp() {
        super.setUp()
        carService = CarsFetchableMock()
        localization = CarListLocalizationProviderMock()
        router = CarDetailsRouterSpy()
        sut = CarListViewModel(
            carService: carService,
            localizationProvider: localization,
            router: router
        )
    }

    // MARK: - Tests

    func test_loadCars_whenGetSuccessfulResponse_updateCarsAndClearMessage() async {
        // Given
        let car = CarRepositoryModelBuilder()
            .setId(1)
            .setMake("Toyota")
            .setModel("Corolla")
            .setPrice(10000)
            .build()
        
        let car2 = CarRepositoryModelBuilder()
            .setId(2)
            .setMake("Toyota2")
            .setModel("Corolla")
            .setPrice(10000)
            .build()
        
        carService.result = .success([car, car2])

        // When
        await sut.loadCars()

        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.infoMessage)
        XCTAssertEqual(sut.cars.count, 2)
        XCTAssertEqual(sut.cars[0].model, "Toyota Corolla")
        XCTAssertEqual(sut.cars[1].model, "Toyota2 Corolla")
    }

    func test_loadCars_whenGetEmptyResponse_setNoCarsMessage() async {
        // Given
        carService.result = .success([])

        // When
        await sut.loadCars()

        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.infoMessage, localization.noCarsMessage)
        XCTAssertTrue(sut.cars.isEmpty)
    }

    func test_loadCars_whenGetFailedToDecodeError_setDecodeMessage() async {
        // Given
        carService.result = .failure(CarRepositoryError.failedToDecode)

        // When
        await sut.loadCars()

        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.infoMessage, localization.failedToDecodeMessage)
        XCTAssertTrue(sut.cars.isEmpty)
    }

    func test_loadCars_whenGetInvalidRequestError_setInvalidRequestMessage() async {
        // Given
        carService.result = .failure(CarRepositoryError.invalidRequestData)

        // When
        await sut.loadCars()

        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.infoMessage, localization.invalidRequestDataMessage)
        XCTAssertTrue(sut.cars.isEmpty)
    }

    func test_loadCars_whenGetUnknownError_setUnknownErrorMessage() async {
        // Given
        carService.result = .failure(.unknown)

        // When
        await sut.loadCars()

        // Then
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.infoMessage, localization.unknownErrorMessage)
        XCTAssertTrue(sut.cars.isEmpty)
    }

    func test_didTapCarDetails_callRouter() {
        // Given
        router.logs = []
        
        // When
        sut.didTapCarDetails(with: 42)
        
        // Then
        XCTAssertEqual(router.logs, [.showCarDetails])
    }
}
