//
//  CarDetailsMapper.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

struct CarDetailsMapper {
    
    private let localizationProvider: CarDetailsLocalizationProviding
    
    init(localizationProvider: CarDetailsLocalizationProviding) {
        self.localizationProvider = localizationProvider
    }
    
    func map(model: CarRepositoryModel) -> CarDetailsModel {
        let modelItem = CarDetailsModel.LineItem(
            title: localizationProvider.modelTitle,
            description: "\(model.make) \(model.model)"
        )
        
        let fuelItem = CarDetailsModel.LineItem(
            title: localizationProvider.fuelTitle,
            description: map(fuel: model.fuel)
        )
        
        let priceItem = CarDetailsModel.LineItem(
            title: localizationProvider.priceTitle,
            description: localizationProvider.price(for: model.price)
        )
        let mileageItem = CarDetailsModel.LineItem(
            title: localizationProvider.mileageTitle,
            description: localizationProvider.mileage(for: model.mileage)
        )
        let descriptionItem = CarDetailsModel.LineItem(
            title: localizationProvider.descriptionTitle,
            description: model.description
        )
        
        let sellerItem: CarDetailsModel.LineItem? = {
            guard let seller = model.seller else { return nil }
            return .init(
                title: localizationProvider.sellerTitle,
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
            localizationProvider.gasolineFuel
        case .diesel:
            localizationProvider.dieselFuel
        case .electric:
            localizationProvider.electricFuel
        case .unknown:
            localizationProvider.unknownFuel
        }
    }
    
    private func makeImages(images: [String]?) -> [CarDetailsModel.Image] {
        guard let images else { return [] }
        return images.map { .init(urlString: $0) }
    }
}
