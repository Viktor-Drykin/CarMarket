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

    func map(response: [CarServiceModel]) -> [CarListModel] {
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
//  let mileage = MeasurementFormatter.measurement.string(from: Measurement(value: Double(carModel.mileage), unit: UnitLength.kilometers))
    
//    static private func map(firstResignation: String?) -> String? {
//        guard
//            let firstResignation = firstResignation,
//            let date = DateFormatter.apiDate.date(from: firstResignation)
//        else {
//            return nil
//        }
//        return DateFormatter.monthAndYearDate.string(from: date)
//    }
}

extension NumberFormatter {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.currencySymbol = "€"
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .currency
        return formatter
    }()
}
