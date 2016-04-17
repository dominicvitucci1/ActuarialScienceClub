//
//  EventsTableViewController.swift
//  ActuarialScienceClub
//
//  Created by Dominic Vitucci on 4/14/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    var events = [Events]()
    var sections: [Section] = SectionsData().getSectionsFromData()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        let year =  String(components.year)
        let month = String(components.month)
        let day = String(components.day)
        
        print(year)
        print(month)
        print(day)
        
        var timeMin = year+"-"
        timeMin += month+"-"
        timeMin += day+"T00:00:00-00:00"
        print(timeMin)

        // 1
        let reposURL = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/ascwebmaster@gmail.com/events?timeMin="+timeMin+"&key=AIzaSyBSG1krlmN4FmzN3SwlDNTOVyzjsH6zrY0")
        

        // 2
        if let JSONData = NSData(contentsOfURL: reposURL!) {
            // 3
            if let json = (try? NSJSONSerialization.JSONObjectWithData(JSONData, options: [])) as? NSDictionary {
                // 4
                if let reposArray = json["items"] as? [NSDictionary] {
                    // 5
                    for item in reposArray {
                        events.append(Events(json: item))
                        events.sortInPlace({ $0.time!.compare($1.time!) == NSComparisonResult.OrderedDescending })
                        
                    }
                }
            }
        }
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "Events Background"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! eventCell
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        }
            
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.titleLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            
        }
        
        cell.titleLabel?.textColor = UIColor.whiteColor()
        cell.detailLabel?.textColor = UIColor.whiteColor()
        cell.timeLabel?.textColor = UIColor.whiteColor()
        
        
        cell.titleLabel?.text = events[indexPath.row].name
        cell.detailLabel?.text = events[indexPath.row].description
        cell.timeLabel?.text = events[indexPath.row].timeFinal
        return cell
    
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Upcoming Events"
        
    }
    
   
}
