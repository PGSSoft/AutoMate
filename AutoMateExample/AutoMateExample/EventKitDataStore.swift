//
//  EventKitDataStore.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit
import UIKit

class EventKitDataStore: DataStore {

    // MARK: DataStore - Typealias
    typealias T = EKCalendarItem

    // MARK: DataStore - Properties
    private(set) var data = [[T](), [T]()]

    // MARK: Private - Properties
    private let store = EKEventStore()
    private lazy var eventsPredicate: NSPredicate = {
        self.store.predicateForEvents(withStart: Date(timeIntervalSince1970: 0), end: Date(timeIntervalSinceNow: 60 * 60 * 24 * 30 * 365), calendars: nil)
    }()
    private lazy var remindersPredicate: NSPredicate = {
        self.store.predicateForReminders(in: nil)
    }()

    // MARK: DataStore - Methods
    func title(for section: Int) -> String? {
        return Section(rawValue: section)?.title
    }

    func reloadData(completion: @escaping () -> Void) {
        requestPermission { [weak self] authorized in
            guard authorized else {
                completion()
                return
            }

            self?.reloadEvents()
            self?.reloadReminders {
                completion()
            }
        }
    }

    // MARK: Private - Methods
    private func update(section: Section, with data: [T]) {
        self.data[section.rawValue] = data
    }

    private func reloadEvents() {
        let events = store.events(matching: eventsPredicate)
        update(section: .event, with: events)
    }

    private func reloadReminders(completion: @escaping () -> Void) {
        store.fetchReminders(matching: remindersPredicate) { [weak self] reminders in
            self?.update(section: .reminder, with: reminders ?? [])
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    private func requestPermission(with completion: @escaping (Bool) -> Void) {
        guard EKEventStore.authorizationStatus(for: .event) != .authorized,
            EKEventStore.authorizationStatus(for: .reminder) != .authorized else {
                completion(true)
                return
        }
        
        store.requestAccess(to: .event) { [weak self] eventsAccess, _ in
            guard eventsAccess else {
                completion(false)
                return
            }
            
            self?.store.requestAccess(to: .reminder) { remindersAccess, _ in
                completion(remindersAccess)
            }
        }
    }

    // MARK: Private - Types
    private enum Section: Int {
        case event, reminder

        var title: String {
            switch self {
            case .event: return "Events"
            case .reminder: return "Reminders"
            }
        }
    }
}
