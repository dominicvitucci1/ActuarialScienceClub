//
//  Section.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 4/14/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import Foundation
import UIKit

struct Section {
    
    var heading : String
    var items : [String]
    
    init(title: String, objects : [String]) {
        
        heading = title
        items = objects
    }
}