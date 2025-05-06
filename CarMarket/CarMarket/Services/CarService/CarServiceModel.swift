//
//  CarServiceModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

struct CarServiceModel {
    let id: Int
    let make: String
    let model: String
    var price: Int
    let firstRegistration: String?
    let mileage: Int
    let fuel: String
    let imageStrings: [String]?
    let description: String
    let modelline: String?
    let seller: Seller?
    
    struct Seller {
        let type: String
        let phone: String
        let city: String
    }
}
