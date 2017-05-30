//
//  JobModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

open class Shift: NSObject {
    
    var tempersNeeded: Int = 0
    var earningsHour: NSDecimalNumber = 0
    var duration: Int = 0
    var startTime: String?
    
    public init(data: [String : Any]) {
        
        if let tempersNeeded = data["tempers_needed"] as? Int {
            self.tempersNeeded = tempersNeeded
        }
        
        if let earningsHour = data["earnings_per_hour"] as? Double {
            self.earningsHour = NSDecimalNumber(value: earningsHour)
        }
        
        if let duration = data["duration"] as? Int {
            self.duration = duration
        }
        
        if let startTime = data["start_time"] as? String {
            self.startTime = startTime
        }
    }
}

open class JobModel: NSObject {
    
    var nameCompany: String?
    var jobId: String?
    var date: String?
    var distance: NSDecimalNumber = 0
    var rating: String?
    var newMatchesCount: Int = 0
    var shifts: [Shift] = []

    var imageUrl: String?
    
    public init(data: [String : Any]) {
        
        if let client = data["client"] as? [String : Any] {
            self.nameCompany = client["name"] as? String
            
            if let rating = client["rating"] as? [String : Any] {
                if let ratingValue = rating["average"] as? String {
                    self.rating = ratingValue
                }
            }
            
            if let hero = client["hero"] as? [String], hero.count > 0 {
                self.imageUrl = hero[0]
            }
        }
        
        self.jobId = data["id"] as? String
        self.date = data["date"] as? String
        
        if let distance = data["distance"] as? Double {
            self.distance = NSDecimalNumber(value: distance)
        }
        
        if let newMatchesCount = data["new_matches_count"] as? Int {
            self.newMatchesCount = newMatchesCount
        }
        
        if let shifts = data["shifts"] as? [[String : Any]] {
            
            for shift in shifts {
                self.shifts.append(Shift(data: shift))
            }
        }
        
        /*
        [{
            "title": "Een top afwasser voor onze locatie op de Danzigerkade 165",
            "id": 257,
            "date": "2017-05-20",
            "distance": 6,
            "url": "https:\/\/temper.works\/f-87z7px",
            "max_possible_earnings_hour": 14,
            "max_possible_earnings_total": 84,
            "client": {
                "name": "PVH Europe",
                "id": "e86ygx",
                "rating": {
                    "average": "4.9",
                    "count": 386,
                    "rated_client_id": 104
                },
                "hero": ["https:\/\/3c84b9d8b8455576d016-ec26f1e225c7d8773d30eb671f4351ea.ssl.cf3.rackcdn.com\/hero\/6110-582d755196175.jpg"],
                "description": "PVH is one of the world's largest\r\napparel companies with over $8 billion\r\nin revenues. We operate three \r\nbusiness groups \u2013 Calvin Klein, \r\nTommy Hilfiger and Heritage Brands."
            },
            "job_category": {
                "description": "Schoonmaak",
                "icon_path": "\/assets\/img\/icon-category-schoonmaak.svg"
            },
            "matches": ["https:\/\/3c84b9d8b8455576d016-ec26f1e225c7d8773d30eb671f4351ea.ssl.cf3.rackcdn.com\/profile120\/787-5824d4c464c34.jpg"],
            "accepted_matches_count": 0,
            "new_matches_count": 1,
            "shifts": [{
                "tempers_needed": 1,
                "earnings_per_hour": 14,
                "duration": 6,
                "currency": "EUR",
                "start_date": "2017-05-20",
                "start_time": "10:00",
                "start_datetime": "2017-05-20 10:00:00",
                "end_time": "16:00",
                "end_datetime": "2017-05-20 16:00:00"
            }]
        */
        /*
        if let id = data["id"] as? Int, id == 257 {
            print("----")
            print(nameCompany!)
            print(date!)
            print(distance)
            print(rating!)
            print(newMatchesCount)
            print(duration)
            //print(startTime!)
            print(tempersNeeded)
            print(earningsHour)
            print(imageUrl!)
            print("----")
        }
 */
    }
}
