//
//  File.swift
//  SwiftX
//
//  Created by Alfredo Martinez on 6/23/20.
//

import Foundation

extension Date {
    
    /// Format a date instance.
    /// - Parameters:
    ///     - format: `String` value that represent the format of the date. `yyyy-MM-dd` by default.
    /// - Returns: A new string with the formatted date.
    public func format(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    /// Create a new date instance based on the components passing as arguments
    /// - Parameters:
    ///     - year: `Int` value that represent the year
    ///     - month: `Int` value that represent the month
    ///     - day: `Int` value that represent the day
    /// - Returns: A new `Date` instance based on the given components
    static public func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = NSCalendar.init(calendarIdentifier: .gregorian)!
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return calendar.date(from: components)!
    }
    
    /// Create a new date instance based `String` value passing as argument, additionaly a custom format be send as second argutment
    /// - Parameters:
    ///     - value: `String` value that represent the date in String format
    ///     - format: `String` value that represent the specified format `yyyy-MM-dd` by default.
    /// - Returns: A new `Date` instance
    static public func parse(_ value: String, format: String = "yyyy-MM-dd") -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.default
        formatter.dateFormat = format
        
        guard let date = formatter.date(from: value) else {
            return Date()
        }
        
        return date
    }
    
    
    /// Get the Difference for Humans from the date instance to current date.
    ///
    /// - Note: If the date instance is `2020-06-16` and you call the `diffForHumans` in `2020-06-23` the output will be `Last week`
    /// - Returns: A string representation of time travel
    public var diffForHumans: String {
        
        let calendar = NSCalendar.current
        let units: Set<Calendar.Component> = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let now = Date()
        let earliest = now < self ? now : self
        let latest = (earliest == now) ? self : now
        let components = calendar.dateComponents(units, from: earliest, to: latest)
        
        guard let year = components.year else { return ""}
        if year >= 2 {
            return "\(year) years ago"
        } else if year == 1 {
            return "Last year"
        }
        
        guard let month = components.month else { return "" }
        if month >= 2 {
            return "\(month) months ago"
        } else if month == 1 {
            return "Last month"
        }
        
        guard let weeks = components.weekOfYear else { return "" }
        if weeks >= 2 {
            return "\(weeks) weeks ago"
        } else if weeks == 1 {
            return "Last week"
        }
        
        guard let day = components.day else { return "" }
        if day >= 2 {
            return "\(day) days ago"
        } else if day == 1 {
            return "Yesterday"
        }
        
        return "Just now"
    }
}
