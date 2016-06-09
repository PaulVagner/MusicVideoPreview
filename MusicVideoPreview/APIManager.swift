//
//  APIManager.swift
//  MusicVideoPreview
//
//  Created by Pavel Vagner on 6/8/16.
//  Copyright © 2016 Paul Vagner. All rights reserved.
//

import Foundation

class APIManager {
    
    //creates function loadData with urlSting as String, with completion which returns results in String form
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
      
        let session = NSURLSession(configuration: config)
        
//        //instantiate a session from NSURLSession class .sharedSession
//        let session = NSURLSession.sharedSession()
        //takes a string and creates an object
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
        
        
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
                
            } else {
                   
                    //Added for JSONSerialization
                    //print(data)
                    
                    do {
                        /* .AllowFragments - top level object is not Array or Dictionary.
                        Any type of string or value.   JSONSerialization requires the Do/ Try/ Catch Concerts the NSDATA into a JSON Object and cast it to a Dictionary */
                        
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject] {
                            
                            print(json)
                            
                         let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()) {
                                    completion(result: "JSONSerialization Successful")
                                }
                            }
                        }
                    } catch {
                        dispatch_async(dispatch_get_main_queue()) {
                            completion(result: "error in NSJSONSerialization")
                        }
                    }
                }
            }
            task.resume()
        }
}
