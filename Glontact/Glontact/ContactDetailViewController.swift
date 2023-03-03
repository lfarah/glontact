//
//  ContactDetailViewController.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import UIKit
import Eureka

class ContactDetailViewController: FormViewController {
    
    let viewModel: ContactDetailViewModel
    
    init(viewModel: ContactDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.contact.firstName
        
        form +++ Section("Info")
        <<< NameRow(){ row in
            row.title = "First Name"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.firstName
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.firstName = row.value ?? ""
        })
        
        <<< NameRow(){ row in
            row.title = "Last Name"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.lastName
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.lastName = row.value ?? ""
        })
        
        <<< NameRow(){ row in
            row.title = "Company"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.companyName
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.companyName = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "Address"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.address
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.address = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "City"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.city
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.city = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "County"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.county
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.county = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "State"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.state
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.state = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "Zip"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.zip
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.zip = row.value ?? ""
        })

        <<< PhoneRow(){ row in
            row.title = "Phone1"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.phone1
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.phone1 = row.value ?? ""
        })

        <<< PhoneRow(){ row in
            row.title = "Phone"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.phone
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.phone = row.value ?? ""
        })

        <<< TextRow(){ row in
            row.title = "Email"
            row.placeholder = "Enter text here"
            row.value = viewModel.contact.email
        }
        .onChange({ [weak self] row in
            self?.viewModel.contact.email = row.value ?? ""
        })
    }
}
