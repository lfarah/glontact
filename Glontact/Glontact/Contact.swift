//
//  Contact.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import Foundation

struct Contact: Codable {
    let firstName: String
    let lastName: String
    let companyName: String
    let address: String
    let city: String
    let county: String
    let state: String
    let zip: String
    let phone1: String
    let phone: String
    let email: String
}
