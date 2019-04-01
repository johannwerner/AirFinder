//
//  TripFeedNetworkCall.swift
//  AirFinder
//
//  Created by Anonymous on 23.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit
import BoltsSwift

let sessionId: String = "d47384ae-b466-4af3-9a82-f83f1066d3bb" //TODO: Should get sessionId from API
    //Could not get the session key to work since it returns ApiToken invalid so used one generated by the test service
let apiToken: String = "ss630745725358065467897349852985"

class TripFeedService: NSObject {
    
    static let sharedInstance = TripFeedService()
    private override init() {}

    func tripFeed(params: [String: Any]? = nil) -> Task<AnyObject> {

        let task = TaskCompletionSource<AnyObject>()
        let requestString = String(format: "http://partners.api.skyscanner.net/apiservices/pricing/uk2/v1.0/%@?apiKey=%@", sessionId, apiToken) //TODO: Use helper here to get correct url
        let service = NetworkLayer.sharedInstance

        service.get(endpointUrl: requestString, parameters: params) { (response) in
            if let error = response as? Error {
                //swift
                task.set(error: error)
            } else {
                task.set(result: response as AnyObject)
            }
        }
        return task.task
    }
    
}
