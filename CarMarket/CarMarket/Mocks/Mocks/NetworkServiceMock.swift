//
//  NetworkServiceMock.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

class NetworkServiceMock: NetworkService {
    
    var result: Result<Any, NetworkError> = .failure(.failedToDecode)
    
    func perform<Output>(urlRequest: URLRequest) async throws -> Output {
        switch result {
        case .success(let value):
            if let value = value as? Output {
                return value
            } else {
                throw NetworkError.failedToDecode
            }
        case .failure(let error):
            throw error
        }
    }
}
