//
//  ViewController.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 3/14/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //navigationItem.titleView = UIImageView(image: UIImage(named: "Top-Bar-Test"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "board" {
            
            if let destinationVC = segue.destinationViewController as? WebViewController
            {
                
                print("Board")
                print(segue.identifier)
                
                
            }
            
            
            
        }
            
        else if segue.identifier == "website" {
            
            if let destinationVC = segue.destinationViewController as? WebViewController
            {
                destinationVC.urlPath = "http://www.ascillinois.com" as String
                print(segue.identifier)
            }
        }
            
        else if segue.identifier == "cube" {
                
            if let destinationVC = segue.destinationViewController as? WebViewController
            {
                destinationVC.urlPath = "https://docs.google.com/spreadsheets/d/1eaQPALW7Va-zecb-ECiOXf6ov0kTHS7rWeqKYJyOMFA/edit#gid=3" as String
                print(segue.identifier)
            }
            
            
        }

    }
}

