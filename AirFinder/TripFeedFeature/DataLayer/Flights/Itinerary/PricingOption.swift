//
//  PricingOption.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
import Gloss
struct PricingOption: JSONDecodable {

    let price: Double
    
    init?(json: JSON) {
        price = ("Price" <~~ json)!
    }
    
}
