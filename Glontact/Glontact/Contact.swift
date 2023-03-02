//
//  Contact.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import Foundation
import Combine

struct Contact: Codable {
    var firstName: String
    var lastName: String
    var companyName: String
    var address: String
    var city: String
    var county: String
    var state: String
    var zip: String
    var phone1: String
    var phone: String
    var email: String
    
    func toUpdatable() -> UpdatableContact {
        UpdatableContact(firstName: firstName, lastName: lastName, companyName: companyName, address: address, city: city, county: county, state: state, zip: zip, phone1: phone1, phone: phone, email: email)
    }
}

class UpdatableContact: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var companyName: String
    @Published var address: String
    @Published var city: String
    @Published var county: String
    @Published var state: String
    @Published var zip: String
    @Published var phone1: String
    @Published var phone: String
    @Published var email: String

    internal init(firstName: String, lastName: String, companyName: String, address: String, city: String, county: String, state: String, zip: String, phone1: String, phone: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.companyName = companyName
        self.address = address
        self.city = city
        self.county = county
        self.state = state
        self.zip = zip
        self.phone1 = phone1
        self.phone = phone
        self.email = email
    }
}
