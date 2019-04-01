//
//  String+Localizable.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
