//
//  JobsListCellViewModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

public protocol JobsListCellViewModelProtocol: ViewModelType {
    
    var nameCompany: String { get }
    var descriptionJob: String { get }
    var startTime: String { get }
    var distance: String { get }
    var rating: String { get }
    var shifts: String { get }
    var newMatchesCount: String { get }
    var duration: String { get }
    var imageUrl: String { get }
}

open class JobsListCellViewModel: JobsListCellViewModelProtocol {
    
    open var nameCompany: String
    open var descriptionJob: String
    open var startTime: String = ""
    open var distance: String
    open var rating: String
    open var shifts: String = ""
    open var newMatchesCount: String
    open var duration: String = ""
    open var imageUrl: String
    
    public init(jobModel: JobModel) {
        
        nameCompany = jobModel.nameCompany ?? ""
        descriptionJob = ""
        distance = "\(jobModel.distance) km"
        rating = jobModel.rating ?? ""
        newMatchesCount = "\(jobModel.newMatchesCount)" + " aanmelding"
        if jobModel.shifts.count > 0 {
            startTime = jobModel.shifts[0].startTime ?? ""
            
            shifts = "\(jobModel.shifts[0].tempersNeeded)" + " open posities vanaf " + "€\(jobModel.shifts[0].earningsHour)/" + "u"
            
            duration = startTime + " (\(jobModel.shifts[0].duration)" + "u" + ")"
        }
        
        imageUrl = jobModel.imageUrl ?? ""
    }
}
