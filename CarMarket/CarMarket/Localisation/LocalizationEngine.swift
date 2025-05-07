//
//  LocalizationEngine.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation

final class LocalizationEngine {
    
    private let locale: Locale
    
    init(locale: Locale) {
        self.locale = locale
    }
    
    public private(set) lazy var carListLocalisationProvider: CarListLocalisationProviding = CarListLocalisationProvider()
    public private(set) lazy var carDetailsLocalisationProvider: CarDetailsLocalisationProviding = CarDetailsLocalisationProvider()
}
