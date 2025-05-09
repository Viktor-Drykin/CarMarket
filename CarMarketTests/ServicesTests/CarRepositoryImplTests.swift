//
//  CarRepositoryImplTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import XCTest
@testable import CarMarket

final class CarRepositoryImplTests: XCTestCase {

    var sut: CarRepositoryImpl!
    var networkServiceMock: CarNetworkServiceMock!
    
    override func setUp() async throws {
        try await super.setUp()
        networkServiceMock = CarNetworkServiceMock()
        sut = CarRepositoryImpl(carNetworkService: networkServiceMock)
    }

    func test_fetchCars_whenSuccessfulMapping_returnsModels() async throws {
        // Given
        let car1 = Response.CarBuilder()
            .setId(1)
            .setMake("Toyota")
            .setModel("Corolla")
            .setPrice(12000)
            .build()
        let car2 = Response.CarBuilder()
            .setId(2)
            .setMake("Toyota2")
            .setModel("Corolla2")
            .setPrice(11000)
            .build()
        networkServiceMock.result = .success([car1, car2])

        // When
        let result = try await sut.fetchCars()
        
        // Then
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[0].make, "Toyota")
        XCTAssertEqual(result[0].model, "Corolla")
        XCTAssertEqual(result[0].price, 12000)
        XCTAssertEqual(result[1].id, 2)
        XCTAssertEqual(result[1].make, "Toyota2")
        XCTAssertEqual(result[1].model, "Corolla2")
        XCTAssertEqual(result[1].price, 11000)
    }

    func test_fetchCars_whenSellerAndImagesAreSet_returnModels() async throws {
        // Given
        let car = Response.CarBuilder()
            .setId(2)
            .setImages(
                [
                    .init(url: "https://img.com/1.jpg"),
                    .init(url: "https://img.com/2.jpg")
                ]
            )
            .setSeller(.init(type: "dealer", phone: "123456", city: "Berlin"))
            .build()

        networkServiceMock.result = .success([car])

        // When
        let result = try await sut.fetchCars()
        
        // Then
        let expectedModel = try XCTUnwrap(result.first)
        XCTAssertEqual(expectedModel.imageStrings, ["https://img.com/1.jpg", "https://img.com/2.jpg"])
        XCTAssertEqual(expectedModel.seller?.city, "Berlin")
        XCTAssertEqual(expectedModel.seller?.phone, "123456")
        XCTAssertEqual(expectedModel.seller?.type, "dealer")
    }

    func test_fetchCars_whenCatchDecodedError_throwsFailedToDecode() async throws {
        // Given
        networkServiceMock.result = .failure(.failedToDecode)
        var expectedError: Error?
        
        // When
        do {
            _ = try await sut.fetchCars()
            XCTFail("The method should throw an error")
        } catch {
            expectedError = error
        }
        
        // Then
        let castedError = try XCTUnwrap(expectedError as? CarRepositoryError)
        XCTAssertEqual(castedError, .failedToDecode)
    }

    func test_fetchCars_whenCatchInvalidRequestDataError_throwsInvalidRequestData() async throws {
        // Given
        networkServiceMock.result = .failure(.invalidStatusCode)
        var expectedError: Error?
        
        // When
        do {
            _ = try await sut.fetchCars()
            XCTFail("The method should throw an error")
        } catch {
            expectedError = error
        }
        
        // Then
        let castedError = try XCTUnwrap(expectedError as? CarRepositoryError)
        XCTAssertEqual(castedError, .invalidRequestData)
    }

    func test_carDetails_whenRequestExistedId_returnsCorrectModel() async throws {
        // Given
        let car = Response.CarBuilder().setId(99).build()
        networkServiceMock.result = .success([car])
        _ = try await sut.fetchCars()
        
        // When
        let details = await sut.carDetails(by: 99)
        
        // Then
        let unwrappedDetails = try XCTUnwrap(details)
        XCTAssertEqual(unwrappedDetails.id, 99)
    }

    func test_carDetails_whenRequestNotExistedId_returnsNil() async throws {
        // Given
        let car = Response.CarBuilder().setId(1).build()
        networkServiceMock.result = .success([car])
        _ = try await sut.fetchCars()
        
        // When
        let details = await sut.carDetails(by: 99)
        
        // Then
        XCTAssertNil(details)
    }
}
