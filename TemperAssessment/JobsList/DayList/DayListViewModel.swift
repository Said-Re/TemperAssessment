//
//  DayListViewModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/23/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit
import ReactiveKit

public protocol DayListViewModelProtocol: ViewModelType {
    
    var dayList: [DayModel] { get }
    var didSelectDay: PublishSubject1<[JobModel]> { get }
    var disposeBag: DisposeBag { get }
    
    func numberOfSections() -> Int
    func numberOfItemsInSection(_ section: Int) -> Int
    func didSelectItemAt(indexPath: IndexPath)
    func viewModelForCell(_ indexPath: IndexPath) -> DayListCellViewModelProtocol
}

open class DayListViewModel: DayListViewModelProtocol {
    
    open var dayList: [DayModel]
    open var didSelectDay = PublishSubject1<[JobModel]>()
    open var disposeBag: DisposeBag = DisposeBag()
    
    public init(dayList: [DayModel]) {
        self.dayList = dayList
    }
    
    open func numberOfSections() -> Int {
        return 1
    }
    
    open func numberOfItemsInSection(_ section: Int) -> Int {
        return dayList.count
    }
    
    open func didSelectItemAt(indexPath: IndexPath) {
        didSelectDay.next(dayList[indexPath.row].jobList)
    }
    
    open func viewModelForCell(_ indexPath: IndexPath) -> DayListCellViewModelProtocol {
        return DayListCellViewModel(day: dayList[indexPath.row])
    }

}
