//
//  CarRepositoryModelBuilder.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation
@testable import CarMarket

struct CarRepositoryModelBuilder {
    private var id: Int = 0
    private var make: String = "DefaultMake"
    private var model: String = "DefaultModel"
    private var price: Int = 10000
    private var firstRegistration: String? = nil
    private var mileage: Int = 0
    private var fuel: CarRepositoryModel.Fuel = .unknown
    private var imageStrings: [String]? = nil
    private var description: String = "Default description"
    private var modelline: String? = nil
    private var seller: CarRepositoryModel.Seller? = nil

    func setId(_ id: Int) -> Self {
        var copy = self
        copy.id = id
        return copy
    }

    func setMake(_ make: String) -> Self {
        var copy = self
        copy.make = make
        return copy
    }

    func setModel(_ model: String) -> Self {
        var copy = self
        copy.model = model
        return copy
    }

    func setPrice(_ price: Int) -> Self {
        var copy = self
        copy.price = price
        return copy
    }

    func setFirstRegistration(_ date: String?) -> Self {
        var copy = self
        copy.firstRegistration = date
        return copy
    }

    func setMileage(_ mileage: Int) -> Self {
        var copy = self
        copy.mileage = mileage
        return copy
    }

    func setFuel(_ fuel: CarRepositoryModel.Fuel) -> Self {
        var copy = self
        copy.fuel = fuel
        return copy
    }

    func setImageStrings(_ urls: [String]?) -> Self {
        var copy = self
        copy.imageStrings = urls
        return copy
    }

    func setDescription(_ description: String) -> Self {
        var copy = self
        copy.description = description
        return copy
    }

    func setModelline(_ modelline: String?) -> Self {
        var copy = self
        copy.modelline = modelline
        return copy
    }

    func setSeller(_ seller: CarRepositoryModel.Seller?) -> Self {
        var copy = self
        copy.seller = seller
        return copy
    }

    func build() -> CarRepositoryModel {
        return CarRepositoryModel(
            id: id,
            make: make,
            model: model,
            price: price,
            firstRegistration: firstRegistration,
            mileage: mileage,
            fuel: fuel,
            imageStrings: imageStrings,
            description: description,
            modelline: modelline,
            seller: seller
        )
    }
}
