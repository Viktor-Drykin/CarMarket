//
//  Launcher.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import UIKit
import SwiftUI

class Launcher {
    
    let window: UIWindow?
    private let navigationController : UINavigationController?

    init(window: UIWindow?) {
        self.window = window
        navigationController = UINavigationController()
    }

    func start() {
//        let viewController = RepositoryListViewController()
//        let apiService = APIClient()
//        let repositoriesService = RepositoriesServiceImpl(apiService: apiService)
//        let viewModel = RepositoryListViewModel(repositoriesService: repositoriesService)
//        viewController.viewModel = viewModel
//        navigationController?.viewControllers = [viewController]
        let view = FeatureFactory.carsFeature()
        let viewController = UIHostingController(rootView: view)
        navigationController?.viewControllers = [viewController]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
