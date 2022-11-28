//
//  YahtzeeModelTests.swift
//  YahtzeeTests
//
//  Created by Arvid Axelsson on 2022-11-28.
//

import XCTest
@testable import Yahtzee

final class YahtzeeModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResetDice() throws {
        let model = YahtzeeModel()
        model.dice.forEach { dieModel in
            dieModel.isActive = false
        }
        
        model.reset()
        model.dice.forEach { dieModel in
            XCTAssertTrue(dieModel.isActive)
        }
    }
    
    func testNumberOfRolls() throws {
        let model = YahtzeeModel()
        
        XCTAssertEqual(model.rolls, 1)
        model.roll()
        XCTAssertEqual(model.rolls, 2)
        model.roll()
        XCTAssertEqual(model.rolls, 3)
        model.roll()
        XCTAssertEqual(model.rolls, 3)
        model.reset()
        XCTAssertEqual(model.rolls, 1)
    }

}
