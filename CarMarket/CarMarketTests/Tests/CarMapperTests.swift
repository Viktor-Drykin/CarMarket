//
//  CarMapperTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//


import XCTest
@testable import CarMarket

final class CarMapperTests: XCTestCase {

    private var localisationProvider: CarListLocalisationProviderMock!
    private var sut: CarMapper!

    override func setUp() {
        super.setUp()
        localisationProvider = CarListLocalisationProviderMock()
        sut = CarMapper(localisationProvider: localisationProvider)
    }

    func test_map_whenSingleCar_returnMappedModel() throws {
        // Given
        let car = CarRepositoryModelBuilder()
            .setId(1)
            .setMake("Tesla")
            .setModel("Model S")
            .setPrice(50000)
            .setMileage(0)
            .setFuel(.electric)
            .setImageStrings(["https://img.com/car.jpg"])
            .setDescription("Electric luxury")
            .build()

        // When
        let result = sut.map(response: [car])

        // Then
        XCTAssertEqual(result.count, 1)
        let expectedModel = try XCTUnwrap(result.first)
        XCTAssertEqual(expectedModel.id, 1)
        XCTAssertEqual(expectedModel.model, "Tesla Model S")
        XCTAssertEqual(expectedModel.price, "€50000")
        XCTAssertEqual(expectedModel.image?.url, "https://img.com/car.jpg")
    }

    func test_map_whenThereAreNoImages_returnModelWithoutImage() throws {
        // Given
        let car = CarRepositoryModelBuilder()
            .setId(1)
            .setMake("Tesla")
            .setModel("Model S")
            .setPrice(50000)
            .setMileage(0)
            .setFuel(.electric)
            .setDescription("Electric luxury")
            .build()

        let result = sut.map(response: [car])

        XCTAssertEqual(result.count, 1)
        let expectedModel = try XCTUnwrap(result.first)
        XCTAssertNil(expectedModel.image)
    }

    func test_map_whenMultipleCars_returnMappedModels() {
        // Given
        let cars = [
            CarRepositoryModelBuilder()
                .setId(1)
                .setMake("BMW")
                .setModel("X3")
                .setPrice(35000)
                .setMileage(0)
                .setFuel(.diesel)
                .setImageStrings(["url1"])
                .build(),
            CarRepositoryModelBuilder()
                .setId(2)
                .setMake("Audi")
                .setModel("Q5")
                .setPrice(45000)
                .setMileage(0)
                .setFuel(.gasoline)
                .setImageStrings(["url2"])
                .build()
        ]

        // When
        let result = sut.map(response: cars)

        // Then
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[0].model, "BMW X3")
        XCTAssertEqual(result[0].price, "€35000")
        XCTAssertEqual(result[0].image?.url, "url1")
        XCTAssertEqual(result[1].id, 2)
        XCTAssertEqual(result[1].model, "Audi Q5")
        XCTAssertEqual(result[1].price, "€45000")
        XCTAssertEqual(result[1].image?.url, "url2")
    }
}
