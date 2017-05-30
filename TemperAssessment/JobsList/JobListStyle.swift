//
//  JobListStyle.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/21/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

open class JobListStyle: StyleType {
    
    open var jobListCellStyle = JobsListCellStyle()
    
    open var titleLabelTextColor: UIColor = .black
    open var titleLabelFont: UIFont = UIFont(name: "ArialMT", size: 28)!
    
    open var alwaysLabelTextColor: UIColor = .black
    open var alwaysLabelFont: UIFont = UIFont(name: "Arial-BoldMT", size: 28)!
    
    open var shiftsNearLabelTextColor: UIColor = .black
    open var shiftsNearLabelFont: UIFont = UIFont(name: "ArialMT", size: 21)!
    
    open var openPositionsLabelTextColor: UIColor = .black
    open var openPositionsLabelFont: UIFont = UIFont(name: "ArialMT", size: 18)!
    
}
