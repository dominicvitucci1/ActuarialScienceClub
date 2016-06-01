//
//  AppDelegate.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 3/14/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Use Firebase library to configure APIs
        FIRApp.configure()
        
        _ = OneSignal(launchOptions: launchOptions, appId: "fd25dd36-2e1e-4df2-b50f-65c620f61514") { (message, additionalData, isActive) in
            NSLog("OneSignal Notification opened:\nMessage: %@", message)
            
            if additionalData != nil {
                NSLog("additionalData: %@", additionalData)
                // Check for and read any custom values you added to the notification
                // This done with the "Additonal Data" section the dashbaord.
                // OR setting the 'data' field on our REST API.
                if let customKey = additionalData["customKey"] as! String? {
                    NSLog("customKey: %@", customKey)
                }
            }
        }
        
        return true
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

