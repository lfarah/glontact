//
//  ContactDetailViewController.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import UIKit
import Eureka

class ContactDetailViewController: FormViewController {
    
    var contact: UpdatableContact
    
    @Published var onChange: [Contact] = []

    init(contact: UpdatableContact) {
        self.contact = contact
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = contact.firstName
        
        form +++ Section("Info")
        <<< NameRow(){ row in
            row.title = "First Name"
            row.placeholder = "Enter text here"
            row.value = contact.firstName
        }
        .onChange({ [weak self] row in
            self?.contact.firstName = row.value ?? ""
        })
        
        <<< NameRow(){ row in
            row.title = "Last Name"
            row.placeholder = "Enter text here"
            row.value = contact.lastName
        }
        .onChange({ [weak self] row in
            self?.contact.lastName = row.value ?? ""
        })
        
        <<< NameRow(){ row in
            row.title = "Company"
            row.placeholder = "Enter text here"
            row.value = contact.companyName
        }
        .onChange({ [weak self] row in
            self?.contact.companyName = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "Address"
            row.placeholder = "Enter text here"
            row.value = contact.address
        }
        .onChange({ [weak self] row in
            self?.contact.address = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "City"
            row.placeholder = "Enter text here"
            row.value = contact.city
        }
        .onChange({ [weak self] row in
            self?.contact.city = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "County"
            row.placeholder = "Enter text here"
            row.value = contact.county
        }
        .onChange({ [weak self] row in
            self?.contact.county = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "State"
            row.placeholder = "Enter text here"
            row.value = contact.state
        }
        .onChange({ [weak self] row in
            self?.contact.state = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "Zip"
            row.placeholder = "Enter text here"
            row.value = contact.zip
        }
        .onChange({ [weak self] row in
            self?.contact.zip = row.value ?? ""
        })

        <<< PhoneRow(){ row in
            row.title = "Phone1"
            row.placeholder = "Enter text here"
            row.value = contact.phone1
        }
        .onChange({ [weak self] row in
            self?.contact.phone1 = row.value ?? ""
        })

        <<< PhoneRow(){ row in
            row.title = "Phone"
            row.placeholder = "Enter text here"
            row.value = contact.phone
        }
        .onChange({ [weak self] row in
            self?.contact.phone = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "Email"
            row.placeholder = "Enter text here"
            row.value = contact.email
        }
        .onChange({ [weak self] row in
            self?.contact.email = row.value ?? ""
        })
    }
}
