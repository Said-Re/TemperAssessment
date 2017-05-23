//
//  JobModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

open class JobModel: NSObject {
    
    var nameCompany: String?
    var jobId: String?
    var date: String?
    var distance: NSDecimalNumber = 0
    var rating: NSDecimalNumber = 0
    var newMatchesCount: Int = 0
    var duration: Int = 0
    var startTime: String?
    var tempersNeeded: Int = 0
    var earningsHour: NSDecimalNumber = 0
    var imageUrl: String?
    
    public init(data: [String : Any]) {
        
        if let client = data["client"] as? [String : Any] {
            self.nameCompany = client["name"] as? String
            
            if let rating = client["average"] as? NSDecimalNumber {
                self.rating = rating
            }
            
            if let hero = client["hero"] as? [String], hero.count > 0 {
                self.imageUrl = hero[0]
            }
        }
        
        self.jobId = data["id"] as? String
        self.date = data["date"] as? String
        
        if let distance = data["distance"] as? NSDecimalNumber {
            self.distance = distance
        }
        
        if let newMatchesCount = data["new_matches_count"] as? Int {
            self.newMatchesCount = newMatchesCount
        }
        
        
        if let shifts = data["shifts"] as? [String : Any] {
            if let duration = shifts["duration"] as? Int {
                self.duration = duration
            }
            
            self.startTime = shifts["start_time"] as? String
            
            if let tempersNeeded = shifts["tempers_needed"] as? Int {
                self.tempersNeeded = tempersNeeded
            }
            
            if let earningsHour = shifts["earnings_per_hour"] as? NSDecimalNumber {
                self.earningsHour = earningsHour
            }
        }
    }
}
