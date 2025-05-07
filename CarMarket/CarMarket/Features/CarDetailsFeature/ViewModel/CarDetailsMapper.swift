//
//  CarDetailsMapper.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

struct CarDetailsMapper {
    
    private let localisationProvider: CarDetailsLocalisationProviding
    
    init(localisationProvider: CarDetailsLocalisationProviding) {
        self.localisationProvider = localisationProvider
    }
    
    func map(model: CarRepositoryModel) -> CarDetailsModel {
        let modelItem = CarDetailsModel.LineItem(
            title: localisationProvider.modelTitle,
            description: "\(model.make) \(model.model)"
        )
        
        let fuelItem = CarDetailsModel.LineItem(
            title: localisationProvider.fuelTitle,
            description: map(fuel: model.fuel)
        )
        
        let priceItem = CarDetailsModel.LineItem(
            title: localisationProvider.priceTitle,
            description: localisationProvider.price(for: model.price)
        )
        let mileageItem = CarDetailsModel.LineItem(
            title: localisationProvider.mileageTitle,
            description: localisationProvider.mileage(for: model.mileage)
        )
        let descriptionItem = CarDetailsModel.LineItem(
            title: localisationProvider.descriptionTitle,
            description: model.description
        )
        
        let sellerItem: CarDetailsModel.LineItem? = {
            guard let seller = model.seller else { return nil }
            return .init(
                title: localisationProvider.sellerTitle,
                description: "\(seller.city), \(seller.phone), \(seller.type)"
            )
        }()
        
        let items = [
            modelItem,
            fuelItem,
            priceItem,
            mileageItem,
            descriptionItem,
            sellerItem
        ]
            .compactMap { $0 }
        
        return .init(id: model.id,
                     images: makeImages(images: model.imageStrings),
                     lineItems: items)
    }
    
    private func map(fuel: CarRepositoryModel.Fuel) -> String {
        switch fuel {
        case .gasoline:
            localisationProvider.gasolineFuel
        case .diesel:
            localisationProvider.dieselFuel
        case .electric:
            localisationProvider.electricFuel
        case .unknown:
            localisationProvider.unknownFuel
        }
    }
    
    private func makeImages(images: [String]?) -> [CarDetailsModel.Image] {
        guard let images else { return [] }
        return images.map { .init(urlString: $0) }
    }
}
