//
//  Double.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 29.12.2021.
//

import Foundation

extension Double {
    
    ///Converts a Double to  a Currency with 2 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    ///Converts a Double to  a Currency as a String with 2 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    ///Converts a Double to  a Currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    ///Converts a Double to  a Currency as a String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    ///Converts a Double into String with 2 decimal places
    ///```
    ///Convert 12.3456 to "12.34"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Converts a Double into String with percent symbol
    ///```
    ///Convert 12.3456 to "12.34$"
    ///```
    func asPercentString() -> String {
        asNumberString() + "%"
    }
}