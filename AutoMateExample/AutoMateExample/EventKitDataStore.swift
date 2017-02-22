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
    // MARK: Typealias
    typealias T = EKCalendarItem
    // MARK: Properties
    weak var delegate: DataStoreDelegate?
    private(set) var data = [[T](), [T]()]

    private let store = EKEventStore()
    private lazy var eventsPredicate: NSPredicate = {
        self.store.predicateForEvents(withStart: Date(timeIntervalSince1970: 0), end: Date(timeIntervalSinceNow: 60 * 60 * 24 * 30 * 365), calendars: nil)
    }()
    private lazy var remindersPredicate: NSPredicate = {
        self.store.predicateForReminders(in: nil)
    }()

    // MARK: Methods
    func title(for section: Int) -> String? {
        return Section(rawValue: section)?.title
    }

    func reloadData() {
        let events = store.events(matching: eventsPredicate)
        update(section: .event, with: events)

        store.fetchReminders(matching: remindersPredicate) { [weak self] in
            self?.update(section: .reminder, with: $0 ?? [])
            DispatchQueue.main.async {
                self?.delegate?.didFinishReloadData(store: self!)
            }
        }
    }

    // MARK: Private
    private func update(section: Section, with data: [T]) {
        self.data[section.rawValue] = data
    }

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
