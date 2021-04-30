//
//  Alarm+Convenience.swift
//  AlarmCoreData
//
//  Created by Bryson Jones on 4/29/21.
//

import CoreData

extension Alarm {
    
    convenience init(title: String, isEnabled: Bool, fireDate: Date, uuidString: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.title = title
        self.isEnabled = isEnabled
        self.fireDate = fireDate
        self.uuidString = uuidString
    }
}
