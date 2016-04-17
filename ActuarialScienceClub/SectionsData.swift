//
//  SectionsData.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 4/14/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import Foundation
import UIKit

class SectionsData {
    
    func getSectionsFromData() -> [Section] {
        
        // you could replace the contents of this function with an HTTP GET, a database fetch request,
        // or anything you like, as long as you return an array of Sections this program will
        // function the same way.
        
        var sectionsArray = [Section]()
        var events = [Events]()
        
        let animals = Section(title: "Animals", objects: ["Cats", "Dogs", "Birds", "Lions"])
        let vehicles = Section(title: "Vehicles", objects: ["Cars", "Boats", "Planes", "Motorcycles", "Trucks"])
        let movies = Section(title: "Movies", objects: ["Blade Runner", "Mad Max", "Transcendent Man", "Jurassic World"])
        
        
        sectionsArray.append(animals)
        sectionsArray.append(vehicles)
        sectionsArray.append(movies)
        
        
        return sectionsArray
    }
}