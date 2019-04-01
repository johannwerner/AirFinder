//
//  FlightTableViewCell.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit
import SDWebImage

class FlightTableViewCell: UITableViewCell {

    @IBOutlet weak var airlineLogoImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        airlineLogoImageView.contentMode = .scaleAspectFit
    }
    
    func setModel(flightLeg: FlightLeg) {
        airlineLogoImageView.image = nil
        airlineLogoImageView.sd_setImage(with: flightLeg.carrier?.imageUrl, completed: nil)
        timeLabel.text = flightLeg.departureArrival
    }
}
