//
//  ContactsViewController.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import UIKit
import Combine

class ContactsViewController: UIViewController {

    var cancellable: AnyCancellable?
    
    let viewModel = ContactsViewModel()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        bind()
    }
    
    func layout() {
        title = "Contacts"
        
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func bind() {
        tableView.register(type: ContactCell.self)
        cancellable = viewModel.contactStore.objectWillChange.sink(receiveValue: { [weak self] _ in
            self?.tableView.reloadData()
        })
    }
}

// MARK: - UITableViewDataSource
extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.contactStore.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: ContactCell.self, indexPath: indexPath)
        let contact = viewModel.contactStore.contacts[indexPath.row]
        
        cell.name = contact.firstName
        cell.company = contact.companyName
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If I had more time, I would've implemented a Coordinator
        let contact = viewModel.contactStore.contacts[indexPath.row]
        
        let viewModel = ContactDetailViewModel(contact: contact)
        let viewController = ContactDetailViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
