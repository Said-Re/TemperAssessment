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
    }
}
