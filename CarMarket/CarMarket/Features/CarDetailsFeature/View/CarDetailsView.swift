//
//  CarDetailsView.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//

import SwiftUI

struct CarDetailsView: View {

    @ObservedObject var viewModel: CarDetailsViewModel

    init(viewModel: CarDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        if let model = viewModel.carDetailsModel {
            content(with: model)
        } else if let message = viewModel.message  {
            Text(message)
        } else {
            ProgressView()
        }
    }
    
    private func content(with model: CarDetailsModel) -> some View {
        List {
            if let images = viewModel.carDetailsModel?.images {
                imagesView(with: images)
                    .listRowSeparator(.hidden)
            }
            
            ForEach(model.lineItems, id: \.self) { item in
                HStack {
                    Text(item.title)
                        .modifier(Headline())
                    Text(item.description)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func imagesView(with images: [CarDetailsModel.Image]) -> some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 0) {
                    ForEach(images) { image in
                        ImageView(urlString: image.urlString)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: 300, alignment: .center)
                            .border(.blue)
                            .clipped()
                    }
                }
            }
        }
        .frame(height: 300)
    }
}

//#Preview {
//    let seller = CarItem.Seller(type: "Private", phone: "123-456-7890", city: "Berlin")
//
//    let car = CarItemBuilder()
//        .setId(1)
//        .setModel("BMW X5")
//        .setPrice("$50,000")
//        .setFirstRegistration("2020-05-01")
//        .setMileage("20,000 km")
//        .setFuel("Petrol")
//        .setImages([
//            .init(url: "https://loremflickr.com/g/1600/1200/bmw"),
//            .init(url: "https://loremflickr.com/g/1600/1200/bmw"),
//            .init(url: "https://loremflickr.com/g/1600/1200/bmw"),
//            .init(url: "https://loremflickr.com/g/1600/1200/bmw")
//        ])
//        .setDescription("A luxury SUV in excellent condition.")
//        .setModelline("X-Series")
//        .setSeller(seller)
//        .setColour("Black")
//        .build()
//
//    CarDetailsView(carItem: car)
//}
