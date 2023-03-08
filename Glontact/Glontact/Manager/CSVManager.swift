//
//  CSVManager.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import Foundation
import SwiftCSV
import Combine

protocol ICVSManager {
    func loadCSV(fileName: String) -> AnyPublisher<[Contact], Error>
}

enum CSVManagerError: Error {
    case invalidFile
}

struct CSVManager: ICVSManager {
    
    /// Loads contacts from CSV file.
    func loadCSV(fileName: String) -> AnyPublisher<[Contact], Error> {
        Future<CSV<Enumerated>, Error> { promise in
            do {
                if let resource = try CSV<Enumerated>(
                    name: fileName,
                    extension: "csv",
                    encoding: .utf8) {
                    promise(.success(resource))
                } else {
                    promise(.failure(CSVManagerError.invalidFile))
                }
                    
            } catch let parseError as CSVParseError {
                promise(.failure(parseError))
            } catch {
                promise(.failure(error))
            }
        }
        .flatMap({ csv in
            self.parseCSV(with: csv)
        })
        .eraseToAnyPublisher()
    }
    
    func parseCSV(with csv: CSV<Enumerated>) -> AnyPublisher<[Contact], Error> {
        var contacts: [Contact] = []
        return Future<[Contact], Error> { promise in
            do {
                
                try csv.enumerateAsDict({ dict in
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
            } catch let error {
                promise(.failure(error))
            }
            
            promise(.success(contacts))
        }
        .eraseToAnyPublisher()
        
    }
}
