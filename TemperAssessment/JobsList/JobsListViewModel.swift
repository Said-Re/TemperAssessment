//
//  JobsListViewModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/21/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit
import ReactiveKit

public protocol JobsListViewModelProtocol: ViewModelType {
    
    var jobList: [JobModel] { get set }
    var didUpdateContent: PublishSubject1<Void> { get }
    var disposeBag: DisposeBag { get }
    
    func updatedJobList(jobList: [JobModel])
    func numberOfShifts() -> Int
    func numberOfSections() -> Int
    func numberOfItemsInSection(_ section: Int) -> Int
    func didSelectItemAt(indexPath: IndexPath)
    func viewModelForCell(_ indexPath: IndexPath) -> JobsListCellViewModelProtocol
}

open class JobsListViewModel: JobsListViewModelProtocol {
    
    open var jobList: [JobModel]
    open var didUpdateContent = PublishSubject1<Void>()
    open var disposeBag: DisposeBag = DisposeBag()
    
    public init(jobList: [JobModel]) {
        self.jobList = jobList
    }
    
    open func updatedJobList(jobList: [JobModel]) {
        self.jobList = jobList
        didUpdateContent.next()
    }
    
    open func numberOfShifts() -> Int {
        
        var totalShifts = 0
        
        for jobModel in jobList {
            totalShifts += jobModel.shifts.count
        }
        
        return totalShifts
    }
    
    open func numberOfSections() -> Int {
        return 1
    }
    
    open func numberOfItemsInSection(_ section: Int) -> Int {
        return jobList.count
    }
    
    open func didSelectItemAt(indexPath: IndexPath) {
    
    }
    
    open func viewModelForCell(_ indexPath: IndexPath) -> JobsListCellViewModelProtocol {
        return JobsListCellViewModel(jobModel: jobList[indexPath.row])
    }

}
