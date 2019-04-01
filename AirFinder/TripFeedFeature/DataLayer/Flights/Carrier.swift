//
//  Carrier.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
import Gloss

struct Carrier: JSONDecodable {
    
    let imageUrl: URL?
    let imageUrlString: String?
    let id: Int
    init?(json: JSON) {
        id = ("Id" <~~ json)!
        imageUrlString = "ImageUrl" <~~ json
        imageUrl = URL(string: imageUrlString ?? "")
    }
}
