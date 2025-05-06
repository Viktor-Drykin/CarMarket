//
//  CarServiceError.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

enum CarRepositoryError: Error {
    case invalidRequestData
    case failedToDecode
    case empty
    case unknown
}
