//
//  LoadingViewModel.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit
protocol LoadingViewModelDelegate: class {
    func navigateToFlightsFeature(flight: Flight)
}

enum FeatureToLoad: Int {
    case tripFeedFeature
}

class LoadingViewModel {
    weak var delegate: LoadingViewModelDelegate?
    var featureToLoad: FeatureToLoad
    
    init(featureToLoad: FeatureToLoad) {
        self.featureToLoad = featureToLoad
    }
    
    func loadData() {
        switch featureToLoad {
        case .tripFeedFeature:
            loadTripFeedData()
        }
    }
}

private extension LoadingViewModel {
    func loadTripFeedData() {
        var params: [String: Any] = ["pageIndex": 0]
        params["InboundLegId"] = "EDI-sky"
        params["OutboundLegId"] = "LOND-sky"
        params["pageSize"] = Constants.DefaultValues.PageSize
        //TODO: Handle error here if neccessary
        TripFeedNetworkFlow().tripFeed(params) { [weak self](response, _) in
            if let flight = response as? Flight {
                self?.delegate?.navigateToFlightsFeature(flight: flight)
            }
        }
    }
}
