//
//  CarDetailsModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

struct CarDetailsModel {
    
    struct Seller {
        let phone: String
        let city: String
        let type: String
    }
    
    let id: Int
    let images: [String]
    let model: String
    let fuel: String
    let price: String
    let firstRegistration: String?
    let mileage: String
    let description: String
    let seller: Seller?
    
    init(
        images: [String],
        fuel: String,
        firstRegistration: String?,
        mileage: String,
        description: String,
        id: Int,
        model: String,
        price: String,
        seller: Seller?
    ) {
        self.id = id
        self.images = images
        self.fuel = fuel
        self.firstRegistration = firstRegistration
        self.mileage = mileage
        self.description = description
        self.model = model
        self.price = price
        self.seller = seller
    }
}
