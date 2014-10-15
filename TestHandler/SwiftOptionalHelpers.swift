//
//  OptionalHelpers.swift
//  wusi-ios
//
//  Created by Simon Pang on 16/9/14.
//  Copyright (c) 2014 Wusi. All rights reserved.
//

import Foundation

extension String {
    public func toURL() -> NSURL! {
        return NSURL(string :self)
    }
    
    public var length : Int {
        return countElements(self)
    }
}


extension Int {
    public func toChinese() -> String {

        let string = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"]

        if self < string.count {
            return string[self]
        } else {
            return "\(self)"
        }
    }
    public func toWeekdayInChinese() -> String? {

        let string = ["零", "日", "一", "二", "三", "四", "五", "六"]

        if self < string.count {
            return string[self]
        } else {
            return nil
        }
    }
}

extension String {
    public func prepend(string:String) -> String {
        return "\(string)\(self)"
    }

    public func toFileURL() -> NSURL? {
        return NSBundle.mainBundle().URLForResource(self, withExtension: nil)
    }

    public func addToDictionary(inout dict:[String:AnyObject], forKey key:String) {
        dict[key] = self
    }
}

extension NSObject {
    public func format(fmt : String) -> String {
        return String(format: fmt, self)
    }
}

extension Double {
    func format(fmt : String) -> String {
        return String(format: fmt, self)
    }
}

extension Optional {
    func take(handler:(T -> Void)?) {
        switch (self) {
        case .Some(let obj):
            handler?(obj)
        default:
            break
        }
    }
}


// MARK: Date

/*
public func initValueTransformers() {
    
    let dayDisplayFormatter = NSDateFormatter()
    dayDisplayFormatter.dateFormat = "d"
    NSValueTransformer.registerValueTransformerWithName("day", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return dayDisplayFormatter.stringFromDate($0 as NSDate)
        }) {
            return dayDisplayFormatter.dateFromString($0 as String)
    }
    
    let dateTimeDisplayFormatter = NSDateFormatter()
    dateTimeDisplayFormatter.locale = NSLocale(localeIdentifier: "zh-Hans")
    dateTimeDisplayFormatter.dateStyle = .MediumStyle
    dateTimeDisplayFormatter.timeStyle = .ShortStyle
    NSValueTransformer.registerValueTransformerWithName("datetime", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return dateTimeDisplayFormatter.stringFromDate($0 as NSDate)
        }) {
            return dateTimeDisplayFormatter.dateFromString($0 as String)
    }

    let weekDayNumberDisplayFormatter = NSDateFormatter()
    weekDayNumberDisplayFormatter.dateFormat = "e"
    NSValueTransformer.registerValueTransformerWithName("weekdayNumber", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return weekDayNumberDisplayFormatter.stringFromDate($0 as NSDate)
        }) {
            return weekDayNumberDisplayFormatter.dateFromString($0 as String)
    }

    let weekDayDisplayFormatter = NSDateFormatter()
    weekDayDisplayFormatter.dateFormat = "EEE"
    NSValueTransformer.registerValueTransformerWithName("weekday", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return weekDayDisplayFormatter.stringFromDate($0 as NSDate)
        }) {
            return weekDayDisplayFormatter.dateFromString($0 as String)
    }
    
    let shortFormatter = NSDateFormatter()
    shortFormatter.dateFormat = "EEE, d MMMM"
    NSValueTransformer.registerValueTransformerWithName("short", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return shortFormatter.stringFromDate($0 as NSDate)
        }) {
            return shortFormatter.dateFromString($0 as String)
    }
    
    let simpleFormatter = NSDateFormatter()
    simpleFormatter.dateFormat = "yyyy-MM-dd"
    NSValueTransformer.registerValueTransformerWithName("simple", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return simpleFormatter.stringFromDate($0 as NSDate)
        }) {
            return simpleFormatter.dateFromString($0 as String)
    }
    
    let iso8601Formatter = ISO8601DateFormatter()
    iso8601Formatter.includeTime = true
    NSValueTransformer.registerValueTransformerWithName("ios8601", transformedValueClass: NSClassFromString("NSString"), returningTransformedValueWithBlock: {
        return iso8601Formatter.stringFromDate($0 as NSDate)
        }) {
            return iso8601Formatter.dateFromString($0 as String)
    }
}

extension NSDate {
    
    public func toDay() -> String? {
        return NSValueTransformer(forName: "day")!.transformedValue(self) as? String
    }

    public func toDateTime() -> String? {
        return NSValueTransformer(forName: "datetime")!.transformedValue(self) as? String
    }

    public func toWeekDay() -> String? {
        return NSValueTransformer(forName: "weekday")!.transformedValue(self) as? String
    }

    public func toWeekDayNumber() -> String? {
        return NSValueTransformer(forName: "weekdayNumber")!.transformedValue(self) as? String
    }

    public func toShort() -> String? {
        return NSValueTransformer(forName: "short")!.transformedValue(self) as? String
    }

    public func toSimple() -> String? {
        return NSValueTransformer(forName: "simple")!.transformedValue(self) as? String
    }

    public func toISO8601() -> String? {
        return NSValueTransformer(forName: "ios8601")!.transformedValue(self) as? String
    }

    public func durationDescription(startDate:NSDate) -> String? {
        let endDate = self
        let startDate = startDate

        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: startDate, toDate: endDate, options: nil)

        return "\(components.day)天\(components.hour)小时\(components.minute)分钟"
    }

}

extension String {
    public func toDate(transformerName: String) -> NSDate? {
        return NSValueTransformer(forName: transformerName)!.reverseTransformedValue(self) as? NSDate
    }
}
*/


// MARK: AVFoundation

import AVFoundation

extension NSURL {
    public func toAsset() -> AVURLAsset? {
        return AVURLAsset(URL:self, options: nil)
    }
}

extension AVURLAsset {
    public func toPlayerItem() -> AVPlayerItem? {
        return AVPlayerItem(asset: self)
    }
}

// MARK: Helper
public func executeIfFalse(key: String, handler:(()->())) {
    let value = NSProcessInfo.processInfo().environment[key] as? NSString

    if let value = value {
        if value.boolValue == true {
        } else {
            handler()
        }
    } else {
        handler()
    }
}

public func executeIfTrue(key: String, handler:(()->())) {
    let value = NSProcessInfo.processInfo().environment[key] as? NSString
    
    if let value = value {
        if value.boolValue == true {
            handler()
        }
    }
}

public func unwrap<T, U>(a:T?, b:U?, handler:((T, U) -> ())?) -> Bool {
    switch (a, b) {
    case let (.Some(a), .Some(b)):
        if handler != nil {
            handler!(a, b)
        }
        return true
    default:
        return false
    }
}
