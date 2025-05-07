//
//  CarMapper.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//
import Foundation

struct CarMapper {
    
    private let localisationProvider: CarListLocalisationProviding
    
    init(localisationProvider: CarListLocalisationProviding) {
        self.localisationProvider = localisationProvider
    }

    func map(response: [CarRepositoryModel]) -> [CarListModel] {
        response.map { carModel in
            return .init(
                id: carModel.id,
                model: "\(carModel.make) \(carModel.model)",
                price: localisationProvider.price(from: carModel.price),
                image: carModel.imageStrings?.first.map { .init(url: $0) }
            )
        }
    }
}
