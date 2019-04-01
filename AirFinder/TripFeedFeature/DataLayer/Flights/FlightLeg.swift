//
//  FlightLeg.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
import Gloss

struct FlightLeg: JSONDecodable {

    let id: String
    let carriers: [Int]
    var carrier: Carrier?
    var departureArrival: String = ""
    var arrival: String
    var departure: String
    init?(json: JSON) {
        id = ("Id" <~~ json)!
        carriers = ("Carriers" <~~ json)!
        arrival = ("Arrival" <~~ json)!
        departure = ("Departure" <~~ json)!
    }
    
}
