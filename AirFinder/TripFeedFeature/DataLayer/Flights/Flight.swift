//
//  Flight.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
import Gloss

class Flight: JSONDecodable {
    var itineraries: [Itinerary]
    var flightLeg: [FlightLeg]
    var flightSegment: [FlightSegment]
    var carriers: [Carrier]
     required init?(json: JSON) {
        self.itineraries = ("Itineraries" <~~ json)!
        self.flightLeg = ("Legs" <~~ json)!
        self.flightSegment = ("Segments" <~~ json)!
        self.carriers = ("Carriers" <~~ json)!
    }
}
