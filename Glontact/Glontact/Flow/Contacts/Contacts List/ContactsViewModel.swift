//
//  ContactsViewModel.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import Foundation
import Combine

class ContactStore: ObservableObject {
    
    var cancellables: [AnyCancellable] = []

    @Published var contacts: [UpdatableContact] = []

    internal init(contacts: [UpdatableContact] = []) {
        self.contacts = contacts
        
        // get the ObservableObjectPublisher publishers
        let observables = contacts.map { $0.objectWillChange }

        // notify that this object will change when any of the contacts change
        Publishers.MergeMany(observables)
            .sink(receiveValue: { _ in
                self.objectWillChange.send()
            })
           .store(in: &cancellables)
    }
    
}

class ContactsViewModel: ObservableObject {
    @Published var contactStore = ContactStore()
        
    init(manager: ICVSManager = CSVManager()) {
        // Should be an enum
        manager.loadCSV(fileName: "sample_contacts")
            .map { $0.map { $0.toUpdatable() }}
            .replaceError(with: [])
            .map { ContactStore(contacts: $0) }
            .assign(to: &$contactStore)
    }
}
