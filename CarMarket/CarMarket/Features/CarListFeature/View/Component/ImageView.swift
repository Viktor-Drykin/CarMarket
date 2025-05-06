//
//  ImageView.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//
import SwiftUI

struct ImageView: View {

    let urlString: String?

    init(urlString: String?) {
        self.urlString = urlString
    }

    var body: some View {
        if let urlString {
            AsyncImage(
                url: URL(string: urlString))
            { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        } else {
            Rectangle()
                .fill(Color.blue)
        }
    }
}
