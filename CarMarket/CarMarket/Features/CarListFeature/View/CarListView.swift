//
//  CarListView.swift
//  CarMarket
//
//  Created by Viktor Drykin on 18.12.2024.
//

import SwiftUI

struct CarListView: View {

    @ObservedObject var viewModel: CarListViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    init(viewModel: CarListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            GeometryReader { proxy in
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                        ForEach(viewModel.cars) { item in
                            Button {
                                viewModel.didTapCarDetails(with: item.id)
                            } label: {
                                makeCarItemView(width: (proxy.size.width - 30) / 2, item: item)
                            }
                        }
                    }
                }
                .refreshable {
                    Task.detached {
                        await viewModel.loadCars()
                    }
                }
            }
            if viewModel.isLoading {
                ProgressView()
            }
            if let errorMessage = viewModel.infoMessage {
                Text(errorMessage)
                    .modifier(Headline())
            }
        }
        .task {
            await viewModel.loadCars()
        }
    }

    private func makeCarItemView(width: CGFloat, item: CarListModel) -> some View {
        ImageView(urlString: item.image?.url)
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: 200)
            .clipped()
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.model)
                        .font(.title2)
                    Text(item.price)
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
    let viewModel = CarListViewModel(
        carService: CarsFetchableMock(),
        localisationProvider: CarListLocalisationProviderMock(),
        router: CarDetailsRouterSpy()
    )
    let view = CarListView(viewModel: viewModel)
    return view
}
