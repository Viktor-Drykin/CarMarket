//
//  CarListLocalizationProvider.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

protocol CarListLocalizationProviding {
    var noCarsMessage: String { get }
    var invalidRequestDataMessage: String { get }
    var failedToDecodeMessage: String { get }
    var unknownErrorMessage: String { get }
    
    func price(from price: Int) -> String
}

struct CarListLocalizationProvider: CarListLocalizationProviding {
    
    var noCarsMessage: String { "There are no cars" }
    var invalidRequestDataMessage: String { "There is an error with request" }
    var failedToDecodeMessage: String { "There is an error with decoding" }
    var unknownErrorMessage: String { "Something went wrong" }
    
    func price(from price: Int) -> String {
        NumberFormatter.currency.string(from: NSNumber(value: price)) ?? "Check the price with the owner"
    }
}

private extension NumberFormatter {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.currencySymbol = "€"
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .currency
        return formatter
    }()
}
