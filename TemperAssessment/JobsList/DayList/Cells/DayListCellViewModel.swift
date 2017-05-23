//
//  DayListCellViewModel.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/23/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import UIKit

public protocol DayListCellViewModelProtocol: ViewModelType {
    var day: String { get }
}

open class DayListCellViewModel: DayListCellViewModelProtocol {
    
    open var day: String
    
    public init(day: DayModel) {
        self.day = day.day
    }
}
