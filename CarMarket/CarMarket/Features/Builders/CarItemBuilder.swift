//
//  CarItemBuilder.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//
import Foundation

////TODO: move it out of production implementation
//class CarItemBuilder {
//    private var id: Int = 0
//    private var model: String = ""
//    private var price: String = ""
//    private var firstRegistration: String? = nil
//    private var mileage: String = ""
//    private var fuel: String = ""
//    private var images: [CarItem.Image] = []
//    private var description: String = ""
//    private var modelline: String? = nil
//    private var seller: CarItem.Seller? = nil
//    private var colour: String? = nil
//
//    func setId(_ id: Int) -> CarItemBuilder {
//        self.id = id
//        return self
//    }
//
//    func setModel(_ model: String) -> CarItemBuilder {
//        self.model = model
//        return self
//    }
//
//    func setPrice(_ price: String) -> CarItemBuilder {
//        self.price = price
//        return self
//    }
//
//    func setFirstRegistration(_ firstRegistration: String) -> CarItemBuilder {
//        self.firstRegistration = firstRegistration
//        return self
//    }
//
//    func setMileage(_ mileage: String) -> CarItemBuilder {
//        self.mileage = mileage
//        return self
//    }
//
//    func setFuel(_ fuel: String) -> CarItemBuilder {
//        self.fuel = fuel
//        return self
//    }
//
//    func setImages(_ images: [CarItem.Image]) -> CarItemBuilder {
//        self.images = images
//        return self
//    }
//
//    func setDescription(_ description: String) -> CarItemBuilder {
//        self.description = description
//        return self
//    }
//
//    func setModelline(_ modelline: String) -> CarItemBuilder {
//        self.modelline = modelline
//        return self
//    }
//
//    func setSeller(_ seller: CarItem.Seller) -> CarItemBuilder {
//        self.seller = seller
//        return self
//    }
//
//    func setColour(_ colour: String) -> CarItemBuilder {
//        self.colour = colour
//        return self
//    }
//
//    func build() -> CarItem {
//        return CarItem(
//            id: id,
//            model: model,
//            price: price,
//            firstRegistration: firstRegistration,
//            mileage: mileage,
//            fuel: fuel,
//            images: images,
//            description: description,
//            modelline: modelline,
//            seller: seller,
//            colour: colour
//        )
//    }
//}
