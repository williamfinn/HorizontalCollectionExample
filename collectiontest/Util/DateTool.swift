//
//  DateTool.swift
//  collectiontest
//
//  Created by William Finn on 15/03/2021.
//

import Foundation

class DateTool {
    let formatter = DateFormatter()
    
    func getDay(date: Date) -> String {
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
    
    func getNumber(date: Date) -> String {
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    func getDate(str: String) -> Date {
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: str) ?? Date()
    }
    
    func getMonth(date: Date) -> String {
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: date)
    }
    
    func getCurrent() -> Date {
        let date = Date()
        formatter.dateFormat = "yyyy-MM-dd"
        let str = formatter.string(from: date)
        let finalDate = formatter.date(from: str)
        return finalDate ?? Date()
    }
    
    func getTop(date: Date) -> String {
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date)
    }
    
    func datesRange(from: Date, to: Date) -> [Date] {
        
        // credit for this code in: https://stackoverflow.com/questions/49387344/how-to-get-an-array-of-days-between-two-dates-in-swift
        
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }
}
