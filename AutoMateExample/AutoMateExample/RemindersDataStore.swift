//
//  RemindersDataStore.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit

// MARK: - RemindersDataStore
class RemindersDataStore: DataStore {

    // MARK: DataStore - Typealias
    typealias T = ReminderViewModel

    // MARK: DataStore - Properties
    var sectionsCount: Int {
        return 1
    }

    // MARK: Private - Properties
    private var data = [T]()
    private let store = EKEventStore()
    private lazy var remindersPredicate: NSPredicate = {
        self.store.predicateForReminders(in: nil)
    }()

    // MARK: DataStore - Methods
    func dataForRow(at indexPath: IndexPath) -> ReminderViewModel {
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

            self?.reloadReminders {
                completion()
            }
        }
    }

    // MARK: Private - Methods
    private func sortAndUpdate(with reminders: [EKReminder]?) {
        data = reminders?.map(ReminderViewModel.init).sorted(by: <) ?? []
    }

    private func reloadReminders(completion: @escaping () -> Void) {
        store.fetchReminders(matching: remindersPredicate) { [weak self] reminders in
            self?.sortAndUpdate(with: reminders)
            DispatchQueue.main.async {
                completion()
            }
        }
    }

    private func requestPermission(with completion: @escaping (Bool) -> Void) {
        guard EKEventStore.authorizationStatus(for: .reminder) != .authorized else {
                completion(true)
                return
        }

        store.requestAccess(to: .reminder) { remindersAuthorized, _ in
            completion(remindersAuthorized)
        }
    }
}
