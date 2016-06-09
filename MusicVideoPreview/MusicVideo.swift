//
//  MusicVideo.swift
//  MusicVideoPreview
//
//  Created by Pavel Vagner on 6/9/16.
//  Copyright © 2016 Paul Vagner. All rights reserved.
//

import Foundation

class Videos {
    
    //Data Encapsulation
    
    private var _vName: String
    private var _vImageUrl: String
    private var _vVideoUrl: String
    
    //makes a getter
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    init(data: JSONDictionary) {
        
        //if I do not initialize all properties I will get error message
        //return from initializer without initializing all stored properties
    
    
        //Video Name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
            self._vName = vName
        }
        
        else
        
        {
            //May not always get data back from JSON - may want to display message
            // element in JSON in unexpected
        
        _vName = ""
            
        }
        
        
        //Video Image
        if let img = data["im:image"] as? JSONArray,
        image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
            
        }
            
        else
            
        {
            _vImageUrl = ""
            
        }
        
        //Video Url
        if let video = data["link"] as? JSONArray,
        vUrl = video[1] as? JSONDictionary,
        vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
            self._vVideoUrl = vVideoUrl
        }
        
        else
        
        {
         
            _vVideoUrl = ""
        }
    }
    
}