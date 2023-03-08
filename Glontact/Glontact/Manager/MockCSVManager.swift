//
//  MockCSVManager.swift
//  Glontact
//
//  Created by Lucas Farah on 08/03/23.
//

import Foundation
import Combine

struct MockCSVManager: ICVSManager {
    func loadCSV(fileName: String) -> AnyPublisher<[Contact], Error> {
        let mockedValues: [Contact] = []
        return Just(mockedValues)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
