//
//  LoadingViewController.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let viewModel = LoadingViewModel(featureToLoad: FeatureToLoad.tripFeedFeature)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.loadData()
    }
}

extension LoadingViewController: LoadingViewModelDelegate {
    func navigateToFlightsFeature(flight: Flight) {
        let tripFeedViewController = TripFeedViewController(flight: flight)
        navigationController?.pushViewController(tripFeedViewController, animated: true)
    }
}
