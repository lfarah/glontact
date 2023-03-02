//
//  CSVManager.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import Foundation
import SwiftCSV
import Combine

struct CSVManager {
    
    /// Loads contacts from CSV file.
    func loadCSV() -> AnyPublisher<[Contact], Error> {
        Future<[Contact], Error> { promise in
            do {
                let resource: CSV? = try CSV<Enumerated>(
                    name: "sample_contacts",
                    extension: "csv",
                    encoding: .utf8)
                
                var contacts: [Contact] = []
                try resource?.enumerateAsDict({ dict in
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
                        let contact = try decoder.decode(Contact.self, from: jsonData)
                        contacts.append(contact)
                    } catch let error {
                        promise(.failure(error))
                    }
                })
                promise(.success(contacts))
            } catch let parseError as CSVParseError {
                promise(.failure(parseError))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
