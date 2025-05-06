//
//  CarListModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//
import Foundation

struct CarListModel: Identifiable {

    struct Image: Identifiable {
        let id = UUID().uuidString
        let url: String
    }

    let id: Int
    let model: String
    let price: String
    let image: Image?
}
