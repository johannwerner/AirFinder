//
//  TripFeedNetworkFlow.swift
//  AirFinder
//
//  Created by Anonymous on 23.03.19.
//  Copyright © 2019 Anonymous. All rights reserved.
//

import UIKit
import BoltsSwift

class TripFeedNetworkFlow {
    
    static let sharedInstance = TripFeedNetworkFlow()
    
    var completionBlock: FlowCompletion?
    func notifyCompletion(result: AnyObject?, error: Error?) {
        
        if (completionBlock != nil) {
            DispatchQueue.main.async {
                self.completionBlock!(result, error)
            }
        }
    }
    
    func notifyFailureCompletion(error: Error) {
        //        TODO: Handle errors
    }
    
    func tripFeed(_ params: [String: Any], completion: @escaping FlowCompletion) {
        
        completionBlock = completion
        
        TripFeedService.sharedInstance.tripFeed(params: params).continueOnSuccessWithTask { task  -> Task<AnyObject> in
            return self.parseData(response: task as AnyObject)
            }.continueOnSuccessWith { (task) -> AnyObject in
                self.notifyCompletion(result: task as AnyObject, error: nil)
                return task
            }.continueWith { task -> (Task<AnyObject>) in
                if let error = task.error {
                    self.notifyFailureCompletion(error: error)
                }
                return task
        }
    }
}

private extension TripFeedNetworkFlow {
    func parseData(response: AnyObject) -> Task<AnyObject> {
        
        let task = TaskCompletionSource<AnyObject>()
        if let json = response as? JSON, let result = Flight(json: json) {
               task.set(result: result)
        }

        return task.task
        
    }
}
