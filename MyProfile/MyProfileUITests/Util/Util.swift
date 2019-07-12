//
//  Util.swift
//  MyProfileUITests
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import XCTest

class Util {
    static func getCellAtIndex(index: Int, identifier: String)->XCUIElement{
            let table = XCUIApplication().tables.matching(identifier: identifier)
            let cell = table.cells.element(boundBy: index)
            return cell
        }
        
        static func elementFor(cell: XCUIElement, identifier: String) -> XCUIElement {
            let element = cell.staticTexts[identifier].firstMatch
            return element
        }
}
