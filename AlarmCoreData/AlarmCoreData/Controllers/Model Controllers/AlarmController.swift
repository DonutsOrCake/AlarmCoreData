//
//  AlarmController.swift
//  AlarmCoreData
//
//  Created by Bryson Jones on 4/29/21.
//

import CoreData

class AlarmController: AlarmScheduler {
    
    static let sharedInstance = AlarmController()
    
    var alarms: [Alarm] {
        let fetchRequest: NSFetchRequest<Alarm> = Alarm.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    //MARK: - CRUD
    func createAlarm(withTitle title: String, on isEnabled: Bool, and fireDate: Date) {
        let alarm = Alarm(title: title, isEnabled: isEnabled, fireDate: fireDate)
        if isEnabled {
            scheduleUserNotification(for: alarm)
        }
        saveToPersistentStore()
    }
    
    func update(alarm: Alarm, newTitle: String, newFireDate: Date, isEnabled: Bool) {
        cancelUserNotification(for: alarm)
        alarm.title = newTitle
        alarm.fireDate = newFireDate
        alarm.isEnabled = isEnabled
        if isEnabled {
            scheduleUserNotification(for: alarm)
        }
        saveToPersistentStore()
    }
    
    func toggleIsEnabledFor(alarm: Alarm) {
        alarm.isEnabled = !alarm.isEnabled
        alarm.isEnabled ? scheduleUserNotification(for: alarm) : cancelUserNotification(for: alarm)
        saveToPersistentStore()
    }
    
    func delete(alarm: Alarm) {
        cancelUserNotification(for: alarm)
        CoreDataStack.context.delete(alarm)
        saveToPersistentStore()
    }
    
    private func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving Managed Object Context, item not saved")
        }
    }
} // End of class

