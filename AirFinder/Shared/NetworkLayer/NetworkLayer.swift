//
//  NetworkLayer.swift
//  AirFinder
//
//  Created by Anonymous on 23.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit
import Alamofire

typealias ServiceCompletion = (Any) -> Void
typealias JSON = [String: Any]
typealias FlowCompletion = (_ result: AnyObject?, _ error: Error?) -> Void

class NetworkLayer: NSObject {
    
    var headers  = [String: String]()
    
    static let sharedInstance = NetworkLayer()
    private override init() {
        #if DEBUG
        let sharedCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        URLCache.shared = sharedCache
        #endif
    }
    
    func get(endpointUrl: String, parameters: [String: Any]?, completion: @escaping ServiceCompletion) {
        
        Alamofire.request(endpointUrl, method: .get, parameters: parameters, headers: headers).responseJSON { (response) in
            
            if let json = response.result.value as? JSON {
                completion(json)
            } else {
                completion("")
            }
        }
    }
    
}
