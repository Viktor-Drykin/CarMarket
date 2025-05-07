//
//  CarDetailsProvidingMock.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//

import Foundation
@testable import CarMarket

class CarDetailsProvidingMock: CarDetailsProviding {
    
    var result: CarRepositoryModel? = nil
    
    func carDetails(by id: Int) async -> CarMarket.CarRepositoryModel? { result }
}
