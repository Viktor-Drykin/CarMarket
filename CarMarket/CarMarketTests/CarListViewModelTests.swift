//
//  CarListViewModelTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 20.12.2024.
//

@testable import CarMarket
import XCTest

final class CarListViewModelTests: XCTestCase {

    var carService: CarServiceMock!
    var sut: CarListViewModel!

    override func setUp() {
        carService = CarServiceMock()
        sut = CarListViewModel(carService: carService)
    }

    func test_loadCars_whenAPIProvidesCars_thenCarItemsAreNotEmpty() async throws  {
        // given
        carService.result = .success([
            Response.CarBuilder().build(),
            Response.CarBuilder().build()
        ])

        // when
        await sut.loadCars()

        // then
        let carsCount = await sut.cars.count
        let errorMessage = await sut.infoMessage
        XCTAssertEqual(carsCount, 2)
        XCTAssertNil(errorMessage)
    }

    func test_loadCars_APIThrowsError_thenErrorMessageIsNotAbsent() async throws  {
        // given
        carService.result = .failure(CarServiceError.empty)

        // when
        await sut.loadCars()

        // then
        let carsIsEmpty = await sut.cars.isEmpty
        let errorMessage = await sut.infoMessage
        XCTAssertTrue(carsIsEmpty)
        XCTAssertEqual(errorMessage, "There are no cars")
    }
}
