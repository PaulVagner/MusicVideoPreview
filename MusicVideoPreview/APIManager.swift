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
        
        //creates task -> starts out in suspended state
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            //runs on background thread
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result: (error!.localizedDescription))
                    
                } else {
                    completion(result: "NSURLSession successful")
                    print(data)
                }
            }
        }
        // resumes the task
        task.resume()
    
    }
}