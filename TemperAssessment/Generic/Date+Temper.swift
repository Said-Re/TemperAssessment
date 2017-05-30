//
//  Date+Temper.swift
//  TemperAssessment
//
//  Created by Said Rehouni on 5/30/17.
//  Copyright © 2017 Said Rehouni. All rights reserved.
//

import Foundation

public enum WeekDay: Int {
    
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
    
    static func getWeekDay(day: Int) -> String {
        switch day {
            case 1: return "Ma"
            case 2: return "Di"
            case 3: return "Wo"
            case 4: return "Do"
            case 5: return "Vr"
            case 6: return "Za"
            case 7: return "Zo"
            default: return ""
        }
    }
}

public enum MonthNumber: Int {
    
    case january = 1
    case february  = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
    
    static func getMonth(month: Int) -> String {
        switch month {
            case 1: return "Jan"
            case 2: return "Feb"
            case 3: return "Maa"
            case 4: return "Apr"
            case 5: return "Mei"
            case 6: return "Jun"
            case 7: return "Jul"
            case 8: return "Aug"
            case 9: return "Sep"
            case 10: return "Okt"
            case 11: return "Nov"
            case 12: return "Dec"
            default: return ""
        }
    }
}

public extension Date {
    
    static func getStringFormattedDate(dateString: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from:dateString)!
        
        let month = Calendar.current.component(.month, from: date)
        let day = Calendar.current.component(.day, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        
        return WeekDay.getWeekDay(day: weekday) + " \(day) " + MonthNumber.getMonth(month: month)
    }
}
