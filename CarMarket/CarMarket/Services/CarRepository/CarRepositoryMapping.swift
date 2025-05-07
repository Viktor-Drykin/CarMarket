//
//  File.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

extension CarRepositoryModel {
    init(with response: Response.Car) {
        self.init(
            id: response.id,
            make: response.make,
            model: response.model,
            price: response.price,
            firstRegistration: response.firstRegistration,
            mileage: response.mileage,
            fuel: .init(with: response.fuel),
            imageStrings: response.images?.map { $0.url },
            description: response.description,
            modelline: response.modelline,
            seller: .init(with: response.seller)
        )
    }
}

extension CarRepositoryModel.Fuel {
    init(with fuelString: String) {
        switch fuelString.lowercased() {
        case "diesel": self = .diesel
        case "gasoline": self = .gasoline
        case "electric": self = .electric
        default : self = .unknown
        }
    }
}

extension CarRepositoryModel.Seller {
    init?(with response: Response.Seller?) {
        guard let response else { return nil }
        self.type = response.type
        self.phone = response.phone
        self.city = response.city
    }
}
