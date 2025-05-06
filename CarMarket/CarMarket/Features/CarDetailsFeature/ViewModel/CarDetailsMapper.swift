//
//  CarDetailsMapper.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

struct CarDetailsMapper {
    
    private let localisationProvider: CarDetailsLocalisationProvider
    
    init(localisationProvider: CarDetailsLocalisationProvider) {
        self.localisationProvider = localisationProvider
    }
    
    func map(domainModel: CarRepositoryModel) -> CarDetailsModel {
        let price = NumberFormatter.currency.string(from: NSNumber(value: domainModel.price)) ?? localisationProvider.priceIsNotSet
        let mileage = MeasurementFormatter.measurement.string(from: Measurement(value: Double(domainModel.mileage), unit: UnitLength.kilometers))
        return
            .init(
            images: domainModel.imageStrings ?? [],
            fuel: domainModel.fuel,
            firstRegistration: domainModel.firstRegistration,
            mileage: mileage,
            description: domainModel.description,
            id: domainModel.id,
            model: "\(domainModel.make) \(domainModel.model)",
            price: price,
            seller: .init(with: domainModel.seller)
        )
    }
    
    private func map(firstResignation: String?) -> String? {
        guard
            let firstResignation = firstResignation,
            let date = DateFormatter.apiDate.date(from: firstResignation)
        else {
            return nil
        }
        return DateFormatter.monthAndYearDate.string(from: date)
    }
}

private extension CarDetailsModel.Seller {
    init?(with seller: CarRepositoryModel.Seller?) {
        guard let seller else { return nil }
        self.init(
            phone: seller.phone,
            city: seller.city,
            type: seller.type
        )
    }
}

private extension DateFormatter {
    
    static let monthAndYearDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter
    }()

    static let apiDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-yyyy"
        return dateFormatter
    }()
}

private extension NumberFormatter {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyCode = "EUR"
        formatter.currencySymbol = "€"
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "DE")
        formatter.numberStyle = .currency
        return formatter
    }()
}

private extension MeasurementFormatter {
    static let measurement: MeasurementFormatter = {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = Locale(identifier: "DE")
        return measurementFormatter
    }()
}

