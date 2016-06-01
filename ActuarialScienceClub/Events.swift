//
//  Events.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 4/14/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import Foundation
import UIKit

class Events {
    
    var name: String?
    var description: String?
    var html_url: String?
    var time: String?
    var timeFinal: String?
    
    init(json: NSDictionary) {
        self.name = json["summary"] as? String
        self.description = json["location"] as? String
        self.time = json["start"]!["dateTime"] as? String
        self.html_url = json["html_url"] as? String
        
        if time == nil {
            self.time = json["start"]!["date"] as? String
        }
        
        print(time)
        
        let dateString           = time
        let dateFormatter        = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date                 = dateFormatter.dateFromString(dateString!)
        
        if date == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date                 = dateFormatter.dateFromString(dateString!)
            dateFormatter.dateFormat = "MMMM d, yyyy | hh:mm a"
            let resultString         = dateFormatter.stringFromDate(date!)
            print(resultString) 
            timeFinal = resultString
        }
        else {
        print(date)
        dateFormatter.dateFormat = "MMMM d, yyyy | hh:mm a"
        let resultString         = dateFormatter.stringFromDate(date!)
        print(resultString)
        timeFinal = resultString
        }
        

    }
}