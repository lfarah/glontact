//
//  CSVManagerTests.swift
//  GlontactTests
//
//  Created by Lucas Farah on 08/03/23.
//

import XCTest
import Combine
@testable import Glontact

final class CSVManagerTests: XCTestCase {

    var bag = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testLoadCSVSuccess() {
        let manager = CSVManager()
        
        let expectation = XCTestExpectation(description: "Your expectation")

        manager.loadCSV(fileName: "sample_contacts")
            .sink { receive in
                switch receive {
                case .finished: break
                case .failure:
                    XCTFail("Shouldn't give an error")
                }

            } receiveValue: { newValue in
                XCTAssertTrue(newValue.count > 0)
                expectation.fulfill()
            }
            .store(in: &bag)
        
        wait(for: [expectation], timeout: 5) // make sure it's more than what you used in AsyncAfter call.
    }
    
    func testLoadCSVError() {
        let manager = CSVManager()
        
        let expectation = XCTestExpectation(description: "Your expectation")
        manager.loadCSV(fileName: "break")
            .sink { receive in
                switch receive {
                case .finished: break
                case .failure(let error):
                    XCTAssertEqual(error as? CSVManagerError, CSVManagerError.invalidFile)
                }
                expectation.fulfill()
            } receiveValue: { _ in
                XCTFail("Shouldn't give a success")
                expectation.fulfill()
            }.store(in: &bag)
        
        wait(for: [expectation], timeout: 5) // make sure it's more than what you used in AsyncAfter call.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
