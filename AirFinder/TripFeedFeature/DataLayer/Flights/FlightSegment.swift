//
//  FlightSegment.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
import Gloss

struct FlightSegment: JSONDecodable {
    
    let arrival: String?
    
    init?(json: JSON) {
        arrival = "Arrival" <~~ json
    }
    
}
