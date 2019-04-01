//
//  TripFeedViewController.swift
//  AirFinder
//
//  Created by Anonymous on 23.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit
import PureLayout

class TripFeedViewController: BaseViewController {

    private var tripFeedViewModel: TripFeedViewModel
    private let flightsTableView = UITableView()
    
    init(flight: Flight, nibName: String? = nil, bundle: Bundle? = nil) {
        tripFeedViewModel = TripFeedViewModel(flight: flight)
        super.init(nibName: nibName, bundle: bundle)
        tripFeedViewModel.createItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        self.title = tripFeedViewModel.title
        self.subtitle = tripFeedViewModel.subtitle
        view.addSubview(flightsTableView)
        flightsTableView.autoPinEdgesToSuperviewEdges()
        flightsTableView.dataSource = self
        flightsTableView.delegate = self
        flightsTableView.backgroundColor = .blue
        flightsTableView.register(UINib.init(nibName: FlightTableViewCell.className, bundle: nil), forCellReuseIdentifier: FlightTableViewCell.className)
        flightsTableView.register(UINib.init(nibName: PriceTableViewCell.className, bundle: nil), forCellReuseIdentifier: PriceTableViewCell.className)
    }
}

extension TripFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripFeedViewModel.itinerariesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let item = tripFeedViewModel.getItemForIndexPath(for: indexPath) else {
            return UITableViewCell()
        }
       
        if let flightLeg = item as? FlightLeg {
            if let cell = tableView.dequeueReusableCell(withIdentifier: FlightTableViewCell.className) as? FlightTableViewCell {
                cell.setModel(flightLeg: flightLeg)
                return cell
            }
        } else if let price = item as? String {
            if let cell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.className) as? PriceTableViewCell {
                cell.setModel(price: price)
                return cell
            }
        }
        
         return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension TripFeedViewController: TripsFeedViewModelDelegate {
    func reloadTableView() {
        flightsTableView.reloadData()
    }
}
