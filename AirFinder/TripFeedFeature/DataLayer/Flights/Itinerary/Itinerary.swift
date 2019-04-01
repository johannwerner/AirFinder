//
//  Itinerary.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
import Gloss

class Itinerary: JSONDecodable {

    let outboundLegId: String
    let inboundLegId: String
    let pricingOptions: [PricingOption]
    var items: [Any] = []
    
    required init?(json: JSON) {
        outboundLegId = ("OutboundLegId" <~~ json)!
        inboundLegId = ("InboundLegId" <~~ json)!
        pricingOptions = ("PricingOptions" <~~ json)!
    }
}
