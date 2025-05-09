//
//  CarItemView.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import SwiftUI

struct CarItemView: View {

    let urlString: String?
    let model: String
    let price: String

    init(urlString: String?, model: String, price: String) {
        self.urlString = urlString
        self.model = model
        self.price = price
    }

    var body: some View {
        ImageView(urlString: urlString)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(model)
                        .font(.title)
                    Text(price)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.white)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [Color.black.opacity(0.8).opacity(0.1), Color.black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                )
            }
    }
}

#Preview {
    CarItemView(urlString: "https://picsum.photos/300/300",
                model: "BMW 316i",
                price: "75,000 $")
    .frame(width: 200, height: 300)
    .background(Color.brown)
}
