//
//  CarMapper.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//
import Foundation

struct CarMapper {
    
    private let localisationProvider: CarListLocalisationProvider
    
    init(localisationProvider: CarListLocalisationProvider) {
        self.localisationProvider = localisationProvider
    }

    func map(response: [CarRepositoryModel]) -> [CarListModel] {
        response.map { carModel in
            let price = NumberFormatter.currency.string(from: NSNumber(value: carModel.price)) ?? localisationProvider.priceIsNotSet
            return .init(
                id: carModel.id,
                model: "\(carModel.make) \(carModel.model)",
                price: price,
                image: carModel.imageStrings?.first.map { .init(url: $0) }
            )
        }
    }
}

private extension NumberFormatter {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.currencySymbol = "€"
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .currency
        return formatter
    }()
}
