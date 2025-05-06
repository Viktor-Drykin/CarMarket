//
//  CarDetailsView.swift
//  CarMarket
//
//  Created by Viktor Drykin on 19.12.2024.
//

import SwiftUI

struct CarDetailsView: View {

//    private let carItem: CarItem
//
//    init(carItem: CarItem) {
//        self.carItem = carItem
//    }
    
    var body: some View {
        EmptyView()
    }

//    var body: some View {
//        List {
//            if !carItem.images.isEmpty {
//                imagesView
//                    .listRowSeparator(.hidden)
//            }
//
//            HStack {
//                Text(carItem.model)
//                    .bold()
//                Text(carItem.fuel)
//                    .foregroundStyle(Color.gray)
//            }
//            .listRowSeparator(.hidden)
//            .frame(maxWidth: .infinity)
//
//            HStack {
//                Text("Price: ")
//                    .modifier(Headline())
//                Text(carItem.price)
//            }
//
//            if let firstRegistration = carItem.firstRegistration {
//                HStack {
//                    Text("Registration: ")
//                        .modifier(Headline())
//                    Text(firstRegistration)
//                }
//            }
//
//            HStack {
//                Text("Mileage:")
//                    .modifier(Headline())
//                Text(carItem.mileage)
//            }
//
//            VStack(alignment: .leading) {
//                Text("Description:")
//                    .modifier(Headline())
//                Text(carItem.description)
//            }
//
//            if let seller = carItem.seller {
//                VStack(alignment: .leading) {
//                    Text("Seller:")
//                        .modifier(Headline())
//                    Text(seller.city)
//                    Text(seller.phone)
//                    Text(seller.type)
//                }
//            }
//        }
//    }

//    private var imagesView: some View {
//        GeometryReader { proxy in
//            ScrollView(.horizontal) {
//                LazyHStack(alignment: .center, spacing: 0) {
//                    ForEach(carItem.images) { image in
//                        ImageView(urlString: image.url)
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: proxy.size.width, height: 300, alignment: .center)
//                            .border(.blue)
//                            .clipped()
//                    }
//                }
//            }
//        }
//        .frame(height: 300)
//    }
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
