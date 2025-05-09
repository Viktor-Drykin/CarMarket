//
//  CarDetailsModel.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//
import Foundation

struct CarDetailsModel: Identifiable {
    
    struct Image: Identifiable {
        let id = UUID().uuidString
        let urlString: String
        
        init(urlString: String) {
            self.urlString = urlString
        }
    }
    
    struct LineItem: Hashable {
        let title: String
        let description: String
    }
    
    let id: Int
    let images: [Image]
    let lineItems: [LineItem]
    
    init(
        id: Int,
        images: [Image],
        lineItems: [LineItem]
    ) {
        self.id = id
        self.images = images
        self.lineItems = lineItems
    }
}
