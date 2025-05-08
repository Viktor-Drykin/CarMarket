//
//  MockLocalizationProvider.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

struct CarDetailsLocalizationProviderMock: CarDetailsLocalizationProviding {
    var noDetails = "No details"
    var gasolineFuel = "Gasoline"
    var dieselFuel = "Diesel"
    var electricFuel = "Electric"
    var unknownFuel = "Unknown"
    var modelTitle = "Model"
    var fuelTitle = "Fuel"
    var priceTitle = "Price"
    var mileageTitle = "Mileage"
    var descriptionTitle = "Description"
    var sellerTitle = "Seller"
    
    func price(for price: Int) -> String {
        return "€\(price)"
    }
    
    func mileage(for mileage: Int) -> String {
        return "\(mileage) km"
    }
}
