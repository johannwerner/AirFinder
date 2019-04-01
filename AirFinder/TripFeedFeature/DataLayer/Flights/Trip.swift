//
//  Trip.swift
//  AirFinder
//
//  Created by Anonymous on 23.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

struct Trip: Codable {
    var flights: [Any]
    
    init(from decoder: Decoder) throws {
        flights = []
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
