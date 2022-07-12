//
//  RoomsTestCases.swift
//  VMTests
//
//  Created by Aneesh on 12/05/22.
//

import XCTest
@testable import VM

class RoomsTestCases: XCTestCase {
    
    //MARK: - Vars & lets
    var viewControllerUnderTest: RoomsAvailabeViewController!
    
    //MARK: - SetUpWithError
    override func setUpWithError() throws {
        self.viewControllerUnderTest = RoomsAvailabeViewController.instantiate(fromAppStoryboard: .main)
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
   // MARK: - TestHasATableView
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.roomsTableView)
    }
    
    //MARK: - TestTableViewConfromsToTableViewDelegateProtocol
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
    }
    
    //MARK: - TestTableViewConformsToTableViewDataSourceProtocol
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }
    
    //MARK: - TestTableViewCellHasReuseIdentifier
    func TableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.roomsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ContactListTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = kContactCellIdentifier
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    //MARK: - TestNumberOfRowsInTableView
    func testNumberOfRowsInTableView() {
        _  = self.viewControllerUnderTest.tableView(viewControllerUnderTest.roomsTableView, numberOfRowsInSection: 0)
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
