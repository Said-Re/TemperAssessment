//
//  JobsListCellViewModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/22/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

public protocol JobsListCellViewModelProtocol: ViewModelType {
    
    var image: UIImage? { get }
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
    
    open var image: UIImage?
    open var nameCompany: String
    open var descriptionJob: String
    open var startTime: String
    open var distance: String
    open var rating: String
    open var shifts: String
    open var newMatchesCount: String
    open var duration: String
    open var imageUrl: String
    
    public init(jobModel: JobModel) {
        
        nameCompany = jobModel.nameCompany ?? ""
        descriptionJob = ""
        startTime = jobModel.startTime ?? ""
        distance = "\(jobModel.distance)"
        rating = "\(jobModel.rating)"
        shifts = ""
        newMatchesCount = ""
        duration = ""
        imageUrl = jobModel.imageUrl ?? ""
    }
}
