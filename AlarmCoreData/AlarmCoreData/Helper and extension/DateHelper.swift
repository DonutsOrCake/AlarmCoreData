//
//  DateHelper.swift
//  AlarmCoreData
//
//  Created by Bryson Jones on 4/29/21.
//

import Foundation
extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
