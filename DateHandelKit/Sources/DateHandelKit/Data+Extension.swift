//
//  File.swift
//
//
//  Created by Jax on 2020/7/31.
//

import Foundation

// 日期格式处理
extension Date {
    /// 日期格式枚举
    enum DateFormatType: String {
        case YMD = "yyyy-MM-dd"
        case YMDHMS = "yyyy-MM-dd HH:mm:ss"
    }

    /// 转化成字符串
    func toString(_ formaType: DateFormatType) -> String {
        toString(formaType.rawValue)
    }

    /// Date -> String
    func toString(_ formatterStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    /// 根据日期字符串获取日期
    static func getDate(_ dateStr: String, formaType: DateFormatType) -> Date? {
        return getDate(dateStr, formatter: formaType.rawValue)
    }

    /// 根据日期字符串获取日期
    static func getDate(_ dateStr: String, formatter: String = "yyyy-MM-dd HH:mm:ss") -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: dateStr)
    }
}

// 日期获取
extension Date {
    static func currentCalendar() -> Calendar {
        var sharedCalendar = Calendar(identifier: .gregorian)

        sharedCalendar.locale = Locale.current

        return sharedCalendar
    }

    /// Example: 2000/1/2 03:04:05 return 2000
    var year: Int {
        return Date.currentCalendar().component(.year, from: self)
    }

    /// Example: 2000/1/2 03:04:05 return 1
    var month: Int {
        return Date.currentCalendar().component(.month, from: self)
    }

    /// Example: 2000/1/2 03:04:05 return 2
    var day: Int {
        return Date.currentCalendar().component(.day, from: self)
    }

    /// Example: 2000/1/2 03:04:05 return 3
    var hour: Int {
        return Date.currentCalendar().component(.hour, from: self)
    }

    /// Example: 2000/1/2 03:04:05 return 4
    var minute: Int {
        return Date.currentCalendar().component(.minute, from: self)
    }

    /// Example: 2000/1/2 03:04:05 return 5
    var second: Int {
        return Date.currentCalendar().component(.second, from: self)
    }
}

extension Date {

    /// the same year
    ///
    /// - Parameter date: contrast time
    /// - Returns: true: equal; false: not equal
    func haveSameYear(_ date: Date) -> Bool {
        return year == date.year
    }

    func haveSameYearAndMonth(_ date: Date) -> Bool {
        return haveSameYear(date) && month == date.month
    }

    func haveSameYearMonthAndDay(_ date: Date) -> Bool {
        let components1 = Date.currentCalendar().dateComponents([.year, .month, .day], from: self)
        let components2 = Date.currentCalendar().dateComponents([.year, .month, .day], from: date)
        return components1 == components2
    }

    func haveSameYearMonthDayAndHour(_ date: Date) -> Bool {
        let components1 = Date.currentCalendar().dateComponents([.year, .month, .day, .hour], from: self)
        let components2 = Date.currentCalendar().dateComponents([.year, .month, .day, .hour], from: date)
        return components1 == components2
    }

    func haveSameYearMonthDayHourAndMinute(_ date: Date) -> Bool {
        let components1 = Date.currentCalendar().dateComponents([.year, .month, .day, .hour, .minute], from: self)
        let components2 = Date.currentCalendar().dateComponents([.year, .month, .day, .hour, .minute], from: date)
        return components1 == components2
    }

    func haveSameYearMonthDayHourMinuteAndSecond(_ date: Date) -> Bool {
        let components1 = Date.currentCalendar().dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        let components2 = Date.currentCalendar().dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        return components1 == components2
    }
}

extension Date {

    /// the number of days in the month
    ///
    /// - Returns: number of day
    func numberOfDaysInMonth() -> Int {
        if let range = Date.currentCalendar().range(of: .day, in: .month, for: self) {
            return range.count
        }

        return 0
    }
}

extension Date {
    func getaddDayDate(day: Int) -> Date {
        let curCalendar: Calendar = NSCalendar.current
        return curCalendar.date(byAdding: Calendar.Component.day, value: 1, to: self) ?? self
    }
}
