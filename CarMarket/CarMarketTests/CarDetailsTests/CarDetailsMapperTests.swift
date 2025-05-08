//
//  CarDetailsMapperTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//

import XCTest
@testable import CarMarket

final class CarDetailsMapperTests: XCTestCase {

    private var sut: CarDetailsMapper!
    private var localization: CarDetailsLocalizationProviderMock!

    override func setUp() {
        super.setUp()
        localization = CarDetailsLocalizationProviderMock()
        sut = CarDetailsMapper(localizationProvider: localization)
    }

    func test_map_whenGetModel_returnMappedModelCorrectly() {
        // Given
        let model = CarRepositoryModelBuilder()
            .setId(1)
            .setMake("Tesla")
            .setModel("Model 3")
            .setPrice(42000)
            .setMileage(10000)
            .setFuel(.electric)
            .setDescription("Great EV")
            .setImageStrings(["img1.jpg", "img2.jpg"])
            .setSeller(.init(type: "Dealer", phone: "123", city: "Berlin"))
            .build()

        // When
        let result = sut.map(model: model)

        // Then
        XCTAssertEqual(result.id, 1)
        XCTAssertEqual(result.images.map(\.urlString), ["img1.jpg", "img2.jpg"])

        let lineItems = result.lineItems
        XCTAssertEqual(lineItems.count, 6)

        XCTAssertEqual(lineItems[0].title, "Model")
        XCTAssertEqual(lineItems[0].description, "Tesla Model 3")
        XCTAssertEqual(lineItems[1].title, "Fuel")
        XCTAssertEqual(lineItems[1].description, "Electric")
        XCTAssertEqual(lineItems[2].title, "Price")
        XCTAssertEqual(lineItems[2].description, "€42000")
        XCTAssertEqual(lineItems[3].title, "Mileage")
        XCTAssertEqual(lineItems[3].description, "10000 km")
        XCTAssertEqual(lineItems[4].title, "Description")
        XCTAssertEqual(lineItems[4].description, "Great EV")
        XCTAssertEqual(lineItems[5].title, "Seller")
        XCTAssertEqual(lineItems[5].description, "Berlin, 123, Dealer")
    }

    func test_map_whenSellerIsNil_returnsNoSellerInfo() {
        // Given
        let model = CarRepositoryModelBuilder()
            .setSeller(nil)
            .build()

        // When
        let result = sut.map(model: model)
        
        // Then
        XCTAssertFalse(result.lineItems.contains(where: { $0.title == "Seller" }))
    }

    func test_map_whenImagesAreNil_returnEmptyArray() {
        // Given
        let model = CarRepositoryModelBuilder()
            .setImageStrings(nil)
            .build()
        
        // When
        let result = sut.map(model: model)
        
        // Then
        XCTAssertTrue(result.images.isEmpty)
    }
    
    func test_map_whenImagesAreNil_returnsEmptyArray() {
        // Given
        let model = CarRepositoryModelBuilder()
            .setImageStrings(nil)
            .build()

        // When
        let result = sut.map(model: model)
        
        // Then
        XCTAssertTrue(result.images.isEmpty)
    }
}
