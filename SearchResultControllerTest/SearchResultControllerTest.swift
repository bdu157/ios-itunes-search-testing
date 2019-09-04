//
//  SearchResultControllerTest.swift
//  SearchResultControllerTest
//
//  Created by Dongwoo Pae on 9/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search  //there is a space so we just used _

class SearchResultControllerTest: XCTestCase {

    /*
     Does decoding actually work?
     Does decoding fail when given bad data?
     Does it build the correct URL?
     Does it build the correct URL Request?
     Are the results saved properl?
     Is the completion handler called if the networking fails?
     Is the completion handler called if the data is bad?
     Is the completion handler called if the data is good?
    */

    func testForSomeResults() {  //see if decoding works
        let mock = MockDataLoader()
        mock.data = goodResultData
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpection = expectation(description: "Wait for results")  //this might have to do with async....
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            resultsExpection.fulfill()
        }
        
        wait(for: [resultsExpection], timeout: 2)
        //Now check results
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting 2 results for GarageBand")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
    }
    
    func testBadResultData() {
        let mock = MockDataLoader()
        mock.data = badResultData
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpecion = expectation(description: "Wait for results")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            resultsExpecion.fulfill()
        }
        
        wait(for: [resultsExpecion], timeout: 2)
        //Now check results
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting 0 results for GarageBand")
        XCTAssertNotNil(controller.error)
    }
    
    
    func testNoResultData() {
        let mock = MockDataLoader()
        mock.data = noResultsData
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpecion = expectation(description: "Wait for results")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            resultsExpecion.fulfill()
        }
        
        wait(for: [resultsExpecion], timeout: 2)
        //Now check results
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting 0 results for GarageBand")
        XCTAssertNil(controller.error)
    }
}
