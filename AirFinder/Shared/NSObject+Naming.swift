//
//  NSObject+Naming.swift
//  AirFinder
//
//  Created by Anonymous on 24.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import Foundation
extension NSObject {
    
    @nonobjc var  className: String {
        return String(describing: type(of: self))
    }
    
    @nonobjc class var className: String {
        return String(describing: self)
    }
}
