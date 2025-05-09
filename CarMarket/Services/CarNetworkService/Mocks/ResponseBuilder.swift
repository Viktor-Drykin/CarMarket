//
//  ResponseBuilder.swift
//  CarMarket
//
//  Created by Viktor Drykin on 20.12.2024.
//
import Foundation

extension Response {
    
    class CarBuilder {
        private var id: Int = 0
        private var make: String = "make"
        private var model: String = "model"
        private var price: Int = 100
        private var firstRegistration: String? = nil
        private var mileage: Int = 1000
        private var fuel: String = "fuel"
        private var images: [Response.Image]? = nil
        private var description: String = "description"
        private var modelline: String? = nil
        private var seller: Response.Seller? = nil
        private var colour: String? = nil

        func setId(_ id: Int) -> CarBuilder {
            self.id = id
            return self
        }

        func setMake(_ make: String) -> CarBuilder {
            self.make = make
            return self
        }

        func setModel(_ model: String) -> CarBuilder {
            self.model = model
            return self
        }

        func setPrice(_ price: Int) -> CarBuilder {
            self.price = price
            return self
        }

        func setFirstRegistration(_ firstRegistration: String) -> CarBuilder {
            self.firstRegistration = firstRegistration
            return self
        }

        func setMileage(_ mileage: Int) -> CarBuilder {
            self.mileage = mileage
            return self
        }

        func setFuel(_ fuel: String) -> CarBuilder {
            self.fuel = fuel
            return self
        }

        func setImages(_ images: [Response.Image]) -> CarBuilder {
            self.images = images
            return self
        }

        func setDescription(_ description: String) -> CarBuilder {
            self.description = description
            return self
        }

        func setModelline(_ modelline: String) -> CarBuilder {
            self.modelline = modelline
            return self
        }

        func setSeller(_ seller: Response.Seller) -> CarBuilder {
            self.seller = seller
            return self
        }

        func setColour(_ colour: String) -> CarBuilder {
            self.colour = colour
            return self
        }

        func build() -> Response.Car {
            return Response.Car(
                id: id,
                make: make,
                model: model,
                price: price,
                firstRegistration: firstRegistration,
                mileage: mileage,
                fuel: fuel,
                images: images,
                description: description,
                modelline: modelline,
                seller: seller,
                colour: colour
            )
        }
    }
}
