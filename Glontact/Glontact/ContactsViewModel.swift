//
//  ContactsViewModel.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import Foundation
import Combine

class ContactsViewModel {
    
    @Published var contacts: [Contact] = []
    
    init(manager: CSVManager = CSVManager()) {
        manager.loadCSV()
            .replaceError(with: [])
            .assign(to: &$contacts)
    }
}
