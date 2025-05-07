//
//  MockRouter.swift
//  CarMarket
//
//  Created by Viktor Drykin on 07.05.2025.
//
import Foundation
@testable import CarMarket

final class CarDetailsRouterSpy: CarDetailsRoute {
    
    enum Method {
        case showCarDetails
    }
    
    var logs: [Method] = []
    
    func showCarDetails(with id: Int) {
        logs.append(.showCarDetails)
    }
}
