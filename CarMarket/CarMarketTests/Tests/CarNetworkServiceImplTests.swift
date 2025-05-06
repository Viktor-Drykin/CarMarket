//
//  CarNetworkServiceImplTests.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//


import XCTest
@testable import CarMarket

final class CarNetworkServiceImplTests: XCTestCase {
    
    var sut: CarNetworkServiceImpl!
    var networkService: NetworkServiceMock!
    
    override func setUp() async throws {
        try await super.setUp()
        networkService = NetworkServiceMock()
        sut = CarNetworkServiceImpl(networkService: networkService)
    }

    func test_fetchCars_whenGetResponse_returnModels() async throws {
        // Given
        let expectedCar = Response.CarBuilder()
            .setId(1)
            .setMake("Tesla")
            .setModel("Model S")
            .setPrice(90000)
            .build()
        networkService.result = .success([expectedCar])
        
        // When
        let cars = try await sut.fetchCars()
        
        // Then
        XCTAssertEqual(cars.count, 1)
        let expectedModel = try XCTUnwrap(cars.first)
        XCTAssertEqual(expectedModel.id, 1)
        XCTAssertEqual(expectedModel.make, "Tesla")
        XCTAssertEqual(expectedModel.model, "Model S")
        XCTAssertEqual(expectedModel.price, 90000)
    }

    func test_fetchCars_whenGetEmptyResponse_returnNoModels() async throws {
        // Given
        networkService.result = .success([])
        
        // When
        let cars = try await sut.fetchCars()
        
        // Then
        XCTAssertTrue(cars.isEmpty)
    }

    func test_fetchCars_whenFailedToDecode_ThrowsDecodedError() async throws {
        // Given
        networkService.result = .failure(.failedToDecode)
        var expectedError: Error?
        
        // When
        do {
            _ = try await sut.fetchCars()
            XCTFail("The method should throw an error")
        } catch {
            expectedError = error
        }
        
        // Then
        let castedError = try XCTUnwrap(expectedError as? CarNetworkServiceError)
        XCTAssertEqual(castedError, .failedToDecode)
    }

    func test_fetchCars_whenInvalidStatusCode_ThrowsInvalidStatusCodeError() async throws {
        // Given
        networkService.result = .failure(.invalidStatusCode)
        var expectedError: Error?
        
        // When
        do {
            _ = try await sut.fetchCars()
            XCTFail("The method should throw an error")
        } catch {
            expectedError = error
        }
        
        // Then
        let castedError = try XCTUnwrap(expectedError as? CarNetworkServiceError)
        XCTAssertEqual(castedError, .invalidStatusCode)
    }
}
