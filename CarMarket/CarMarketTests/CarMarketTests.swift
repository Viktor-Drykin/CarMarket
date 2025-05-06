//
//  CarMarketTests.swift
//  CarMarketTests
//
//  Created by Viktor Drykin on 06.05.2025.
//

import XCTest
@testable import CarMarket

final class CarMapperTests: XCTestCase {

    func test_map_whenGetEmptyArray_returnsEmptyArray() {
        // given
        let input: [Response.Car] = []

        // when
        let carItems = CarMapper.map(response: input)

        // then
        XCTAssertTrue(carItems.isEmpty)
    }

    func test_map_whenGetArray_returnsMappedArray() throws {
        // given
        let carResponse = Response.CarBuilder()
            .setFirstRegistration("08-2020")
            .setImages([Response.Image.init(url: "https://www.photo.com")])
            .setSeller(.init(type: "Private", phone: "911", city: "London"))
            .build()
        let input: [Response.Car] = [carResponse]

        // when
        let carItems = CarMapper.map(response: input)

        // then
        XCTAssertEqual(carItems.count, 1)
        let item = try XCTUnwrap(carItems.first)
        XCTAssertEqual(item.description, "description")
        XCTAssertEqual(item.firstRegistration, "August 2020")
        XCTAssertEqual(item.images.map { $0.url }, ["https://www.photo.com"])
        XCTAssertEqual(item.fuel, "fuel")
        XCTAssertEqual(item.mileage, "1.000 km")
        XCTAssertEqual(item.model, "make model")
        XCTAssertEqual(item.price, "100 €")
        XCTAssertEqual(item.id, 0)
        XCTAssertEqual(item.seller?.city, "London")
        XCTAssertEqual(item.seller?.phone, "911")
        XCTAssertEqual(item.seller?.type, "Private")
    }
}
