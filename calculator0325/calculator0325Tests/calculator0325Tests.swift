//
//  calculator0325Tests.swift
//  calculator0325Tests
//
//  Created by 林猷靖 on 2021/3/25.
//

import XCTest
@testable import calculator0325

class calculator0325Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	@IBOutlet weak var something: UILabel!
	
	override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	@IBAction func num8(_ sender: Any) {
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
