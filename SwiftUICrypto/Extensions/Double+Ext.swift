//
//  Double+Ext.swift
//  SwiftUICrypto
//
//  Created by Siarhei Ramaniuk on 27.05.24.
//

import Foundation

extension Double {

    /// Converts a Double into a Currency with 2-6 decimal places
    ///```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current // <- default value
        formatter.currencyCode = "usd" // <- change currency
        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }

    /// Converts a Double into a Currency as a String with 2-6 decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }

    /// Converts a Double into String with decimals equals to "decimal" argument
    ///```
    /// decimal = 2
    /// Convert 12.756 to "12.76"
    ///
    ///```
    func asNumberString(decimal: Int) -> String {
        String(format: "%.\(decimal)f", self)
    }

    /// Converts a Double into String representation with percent symbol and the decimals equals to "decimal" argument
    ///```
    /// decimal = 2
    /// Convert 12.756 to "12.76%"
    ///
    ///```
    func asPercentString(decimal: Int) -> String {
        String(format: "%.\(decimal)f", self) + "%"
    }
}
