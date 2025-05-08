//
//  CarListMapper.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//
import Foundation

struct CarListMapper {
    
    private let localizationProvider: CarListLocalizationProviding
    
    init(localizationProvider: CarListLocalizationProviding) {
        self.localizationProvider = localizationProvider
    }

    func map(response: [CarRepositoryModel]) -> [CarListModel] {
        response.map { carModel in
            return .init(
                id: carModel.id,
                model: "\(carModel.make) \(carModel.model)",
                price: localizationProvider.price(from: carModel.price),
                image: carModel.imageStrings?.first.map { .init(url: $0) }
            )
        }
    }
}
