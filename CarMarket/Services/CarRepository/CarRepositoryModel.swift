//
//  CarRepositoryModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

struct CarRepositoryModel {
    let id: Int
    let make: String
    let model: String
    var price: Int
    let firstRegistration: String?
    let mileage: Int
    let fuel: Fuel
    let imageStrings: [String]?
    let description: String
    let modelline: String?
    let seller: Seller?
    
    enum Fuel {
        case gasoline
        case diesel
        case electric
        case unknown
    }
    
    struct Seller {
        let type: String
        let phone: String
        let city: String
    }
}
