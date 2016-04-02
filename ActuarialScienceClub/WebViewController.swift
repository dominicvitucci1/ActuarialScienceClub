//
//  webViewController.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 4/1/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit
import Firebase

    
class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var myWebView: UIWebView!
    
    var urlPath = ""
    
    
    override func loadView()
    {
        
        super.loadView()
        myWebView.delegate = self
        loadURL()
    }
    
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func getCurrentUrl(sender: AnyObject)
    {
        let currentURL : NSString = (myWebView.request?.URL!.absoluteString)!
        
        NSLog(currentURL as String)
    }
    
    
    func loadURL()
        
    {
        if urlPath != "" {
            let requestURL = NSURL(string: urlPath)
        
            let request = NSURLRequest(URL: requestURL!)
        
            myWebView.loadRequest(request)
            print(urlPath)
        }
        
        else {
            
            let myRootRef = Firebase(url:"https://uiucacturarial.firebaseio.com/htmlData")
            myRootRef.observeEventType(.Value, withBlock: { snapshot in
                let htmlPath = snapshot.value as! String
                self.myWebView.loadHTMLString(htmlPath, baseURL: nil)
                //print(snapshot.value)
                }, withCancelBlock: { error in
                    print(error.description)
            })

//            self.myWebView.loadHTMLString(htmlPath, baseURL: nil)
//            print("BALLLLLLS"+htmlPath)

        }
        
        
    }
    
    
}
