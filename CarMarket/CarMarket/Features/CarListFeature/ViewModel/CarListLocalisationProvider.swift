//
//  CarListLocalisationProvider.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

struct CarListLocalisationProvider {
    var noCarsMessage: String { "There are no cars" }
    var invalidRequestDataMessage: String { "There is an error with request" }
    var failedToDecodeMessage: String { "There is an error with decoding" }
    var unknownErrorMessage: String { "Something went wrong" }
    var priceIsNotSet: String { "Check the price with the owner" }
}
