//
//  PriceTableViewCell.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setModel(price: String) {
        priceLabel.text = price
    }
    
}
