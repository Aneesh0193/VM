//
//  AvailableRoomsViewModel.swift
//  VMTests
//
//  Created by Aneesh on 12/05/22.
//

import XCTest
@testable import VM



class AvailableRoomsViewModelTests: XCTestCase {
    
    var availableRoomsViewModel = AvailableRoomsViewModel(dependency: MockData())
    
    //MARK: - SetUpWithError
    override func setUp() {
        super.setUp()
        loadJson()
    }
   
    //MARK: - Load Json
    func loadJson(){
        if let url = Bundle.main.url(forResource: kRoomsJsonFilename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Rooms.self, from: data)
                self.availableRoomsViewModel.roomsResponse = jsonData
                getData()
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func getNumberOfRowsInSections() {
        _ = availableRoomsViewModel.getNumberOfRowsInSections()
    }
    
    func getData() {
        _ = availableRoomsViewModel.getData(index: 0)
    }
    
    func getRoomsAvailability() {
        
        _ = availableRoomsViewModel.getRoomsAvailability(index: 0)
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

