//
//  MockLocalisationProvider.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation
@testable import CarMarket

final class CarListLocalisationProviderMock: CarListLocalisationProviding {
    var noCarsMessage: String = "No cars"
    var invalidRequestDataMessage: String = "Invalid request"
    var failedToDecodeMessage: String = "Decode failed"
    var unknownErrorMessage: String = "Unknown error"
    
    var priceFormatter: (Int) -> String = { price in "€\(price)" }

    func price(from price: Int) -> String {
        return priceFormatter(price)
    }
}
