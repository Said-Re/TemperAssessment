//
//  DayModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/23/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

open class DayModel: NSObject {
    
    open var day: String
    open var jobList: [JobModel] = []
    
    public init(dictionary: (key: String, value: Any)) {
        self.day = dictionary.key
        
        if let arrayJobs = dictionary.value as? [[String : Any]] {
            
            for jobModel in arrayJobs {
                jobList.append(JobModel(data: jobModel))
            }
        }
    }

}
