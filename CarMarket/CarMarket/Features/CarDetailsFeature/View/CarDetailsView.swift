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
        VStack(spacing: 0) {
            if let model = viewModel.carDetailsModel {
                content(with: model)
            } else if let message = viewModel.message  {
                Text(message)
            } else {
                ProgressView()
            }
        }
        .task {
            await viewModel.loadCars()
        }
    }
    
    private func content(with model: CarDetailsModel) -> some View {
        List {
            if !model.images.isEmpty {
                imagesView(with: model.images)
                    .listRowSeparator(.hidden)
            }
            
            ForEach(model.lineItems, id: \.self) { item in
                HStack(alignment: .firstTextBaseline) {
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

#Preview {
    let carService = CarDetailsProvidingMock()
    carService.result = CarRepositoryModelBuilder().build()
    let viewModel = CarDetailsViewModel(
        carService: carService,
        localisationProvider: CarDetailsLocalisationProviderMock(),
        carID: 0
    )
    return CarDetailsView(viewModel: viewModel)
}
