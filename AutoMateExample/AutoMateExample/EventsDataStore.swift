//
//  EventsDataStore.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit

// MARK: - EventsDataStore
class EventsDataStore: DataStore {

    // MARK: DataStore - Typealias
    typealias T = EventViewModel

    // MARK: DataStore - Properties
    var sectionsCount: Int {
        return 1
    }

    // MARK: Private - Properties
    private var data = [T]()
    private let store = EKEventStore()
    private lazy var eventsPredicate: NSPredicate = {
        self.store.predicateForEvents(withStart: Date(), end: Date.nextYear, calendars: nil)
    }()

    // MARK: DataStore - Methods
    func dataForRow(at indexPath: IndexPath) -> T {
        return data[indexPath.row]
    }

    func rowsCount(in section: Int) -> Int {
        return data.count
    }

    func title(for section: Int) -> String? {
        return nil
    }

    func reloadData(completion: @escaping () -> Void) {
        requestPermission { [weak self] authorized in
            guard authorized else {
                completion()
                return
            }
            self?.loadData()
        }
    }

    // MARK: Private - Methods
    private func requestPermission(with completion: @escaping (Bool) -> Void) {
        guard EKEventStore.authorizationStatus(for: .event) != .authorized else {
            completion(true)
            return
        }

        store.requestAccess(to: .event) { eventsAuthorized, _ in
            completion(eventsAuthorized)
        }
    }

    private func loadData() {
        let events = store.events(matching: eventsPredicate)
        data = events.map(EventViewModel.init).sorted(by: <)
    }
}
