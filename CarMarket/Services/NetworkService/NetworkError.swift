//
//  NetworkError.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//
import Foundation

enum NetworkError: Error {
    case invalidStatusCode
    case failedToDecode
}
