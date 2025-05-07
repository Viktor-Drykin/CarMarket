//
//  NetworkService.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import Foundation

protocol NetworkService: AnyObject {
    func perform<Output: Decodable>(urlRequest: URLRequest) async throws -> Output
}
