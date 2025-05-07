//
//  CarDetailsLocalisationProvider.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

protocol CarDetailsLocalisationProviding {
    var noDetails: String { get }
    var gasolineFuel: String { get }
    var dieselFuel: String { get }
    var electricFuel: String { get }
    var unknownFuel: String { get }
    var modelTitle: String { get }
    var fuelTitle: String { get }
    var priceTitle: String { get }
    var mileageTitle: String { get }
    var descriptionTitle: String { get }
    var sellerTitle: String { get }
    
    func price(for price: Int) -> String
    func mileage(for mileage: Int) -> String
}

struct CarDetailsLocalisationProvider: CarDetailsLocalisationProviding {
    
    var priceIsNotSet: String { "Check the price with the owner" }
    var noDetails: String { "No details found" }
    var gasolineFuel: String { "Gasoline" }
    var dieselFuel: String { "Diesel" }
    var electricFuel: String { "Electric" }
    var unknownFuel: String { "Check with the owner" }
    var modelTitle: String { "Model" }
    var fuelTitle: String { "Fuel" }
    var priceTitle: String { "Price" }
    var mileageTitle: String { "Mileage" }
    var descriptionTitle: String { "Description" }
    var sellerTitle: String { "Seller" }
    
    func price(for price: Int) -> String {
        NumberFormatter.currency.string(from: NSNumber(value: price)) ?? priceIsNotSet
    }
    
    func mileage(for mileage: Int) -> String {
        MeasurementFormatter.measurement.string(from: Measurement(value: Double(mileage), unit: UnitLength.kilometers))
    }
}

private extension MeasurementFormatter {
    static let measurement: MeasurementFormatter = {
        let measurementFormatter = MeasurementFormatter()
        return measurementFormatter
    }()
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
