//
//  JobsListCellStyle.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

open class JobsListCellStyle: StyleType {
    
    open var distanceLabelTextColor: UIColor = .white
    open var distanceLabelFont: UIFont = UIFont(name: "ArialMT", size: 15)!
    
    open var nameCompanyLabelTextColor: UIColor = .black
    open var nameCompanyLabelFont: UIFont = UIFont(name: "ArialMT", size: 18)!
    
    open var ratingLabelTextColor: UIColor = .green
    open var ratingLabelFont: UIFont = UIFont(name: "ArialMT", size: 17)!
    
    open var descriptionJobLabelTextColor: UIColor = .black
    open var descriptionJobLabelFont: UIFont = UIFont(name: "ArialMT", size: 15)!
    
    open var newMatchesCountLabelTextColor: UIColor = .gray
    open var newMatchesCountLabelFont: UIFont = UIFont(name: "ArialMT", size: 14)!
    
    open var durationLabelTextColor: UIColor = .gray
    open var durationLabelFont: UIFont = UIFont(name: "ArialMT", size: 14)!

}
