//
//  LocalizationEngine.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

final class LocalizationEngine {
    
    private(set) lazy var carListLocalizationProvider: CarListLocalizationProviding = CarListLocalizationProvider()
    private(set) lazy var carDetailsLocalizationProvider: CarDetailsLocalizationProviding = CarDetailsLocalizationProvider()
}

extension LocalizationEngine: LocalizationProviding {}

typealias LocalizationProviding = (
    HasCarListLocalizationProviding &
    HasCarDetailsLocalizationProviding
)

protocol HasCarListLocalizationProviding {
    var carListLocalizationProvider: CarListLocalizationProviding { get }
}

protocol HasCarDetailsLocalizationProviding {
    var carDetailsLocalizationProvider: CarDetailsLocalizationProviding { get }
}
