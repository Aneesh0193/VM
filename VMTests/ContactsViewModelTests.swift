//
//  VMTests.swift
//  VMTests
//
//  Created by Aneesh on 11/05/22.
//

import XCTest
@testable import VM

class VMTests: XCTestCase {
    
    var contactViewModel = ContactViewModel()
    
    //MARK: - SetUpWithError
    override func setUp() {
        super.setUp()
        loadJson()
    }
   
    //MARK: - Load Json
    func loadJson(){
        if let url = Bundle.main.url(forResource: kContactJsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Contacts.self, from: data)
                self.contactViewModel.contactResponse = jsonData
                getData()
                profileImage()
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func testNumberOfRowsInSections() {
        _ = contactViewModel.getNumberOfRowsInSections()
    }
    
    func getData() {
        _ = contactViewModel.getData(index: 0)
    }
    
    func profileImage() {
        _ = contactViewModel.getProfileImage(index: 0)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
