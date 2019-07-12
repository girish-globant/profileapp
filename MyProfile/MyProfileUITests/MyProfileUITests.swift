//
//  MyProfileUITests.swift
//  MyProfileUITests
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import XCTest
import Foundation

enum TestIdentifiers: String{
    case profileTableView = "profileTableView"
    case PersonalInfoCellFirstName = "PersonalInfoCellFirstName"
    case PersonalInfoCellMobile = "PersonalInfoCellMobile"
    
    case ProfessionalSummaryCellDescription = "ProfessionalSummaryCellDescription"
    
    case CompanyCellName = "CompanyCellName"
    case CompanyCellDesignation = "CompanyCellDesignation"
    case CompanyCellDuration = "CompanyCellDuration"
    case CompanyCellJobSummery = "CompanyCellJobSummery"
    
    case EducationUniversity = "EducationUniversity"
    case EducationCourseName = "EducationCourseName"
    case EducationDuration = "EducationDuration"
}

class MyProfileUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
  
    func testPersonalInfoCell() {
        
        let cell = Util.getCellAtIndex(index: 0, identifier: TestIdentifiers.profileTableView.rawValue)
        XCTAssertTrue(cell.exists)
        
        let firstName = Util.elementFor(cell: cell, identifier: TestIdentifiers.PersonalInfoCellFirstName.rawValue)
        XCTAssertTrue(firstName.exists)
        XCTAssertEqual(firstName.label,"Girish Muchalambe")

        let mobile = Util.elementFor(cell: cell, identifier: TestIdentifiers.PersonalInfoCellMobile.rawValue)
        XCTAssertTrue(mobile.exists)
        XCTAssertEqual(mobile.label,"9975253927")
    }
    
    func testProfessionalSummaryCell(){
        let cell = Util.getCellAtIndex(index: 1, identifier: TestIdentifiers.profileTableView.rawValue)
        XCTAssertTrue(cell.exists)
        
        let description = Util.elementFor(cell: cell, identifier: TestIdentifiers.ProfessionalSummaryCellDescription.rawValue)
        XCTAssertTrue(description.exists)
        XCTAssertEqual(description.label,"Girish has 9+ years of experience in the iOS mobile development. He develop applications using Swift, Objective C, XCode, Interface Builder, Instruments, Cocoa Touch, and other iOS development tools. He has good understanding of Apple approval distribution process. He has experience working with RESTful API type web services. He has good knowledge of Source Code Management systems such as Gitlab, Git, BitBucket. He has strong experience working with Agile Methodologies. He has used analytics tools such as Crashlytics, Fabric, Google Analytics.He is self starter, highly motivated individual, and a team player who adapts to a dynamic work environment")
    }
    
    func testCompanyCell(){
        let cell = Util.getCellAtIndex(index: 2, identifier: TestIdentifiers.profileTableView.rawValue)
        XCTAssertTrue(cell.exists)

                                let name = Util.elementFor(cell: cell, identifier: TestIdentifiers.CompanyCellName.rawValue)
        XCTAssertTrue(name.exists)
        XCTAssertEqual(name.label,"Globant India")
        
        let designation = Util.elementFor(cell: cell, identifier: TestIdentifiers.CompanyCellDesignation.rawValue)
        XCTAssertTrue(designation.exists)
        XCTAssertEqual(designation.label,"iOS Developer")
        
        let duration = Util.elementFor(cell: cell, identifier: TestIdentifiers.CompanyCellDuration.rawValue)
        XCTAssertTrue(duration.exists)
        XCTAssertEqual(duration.label,"Dec 2017 - Till Date")
        
        let jobSummery = Util.elementFor(cell: cell, identifier: TestIdentifiers.CompanyCellJobSummery.rawValue)
        XCTAssertTrue(jobSummery.exists)
        XCTAssertEqual(jobSummery.label,"Write efficient, maintainable and reusable code prioritizing privacy and security. Simultaneously manage multiple projects and meet many strict deadlines. Created applications that interact with RESTful services and backends. Created reusable components that can be applied to iOS applications developed throughout the organization. Write technical documents, user guides and support documentation")
    }
    
    func testEducationCell() {
    
        let cell = Util.getCellAtIndex(index: 6, identifier: TestIdentifiers.profileTableView.rawValue)
        XCTAssertTrue(cell.exists)
        
        let university = Util.elementFor(cell: cell, identifier: TestIdentifiers.EducationUniversity.rawValue)
        XCTAssertTrue(university.exists)
        XCTAssertEqual(university.label,"Pune University, Pune, India")
        
        let courseName = Util.elementFor(cell: cell, identifier: TestIdentifiers.EducationCourseName.rawValue)
        XCTAssertTrue(courseName.exists)
        XCTAssertEqual(courseName.label,"Master of Computer Applications")
        
        let duration = Util.elementFor(cell: cell, identifier: TestIdentifiers.EducationDuration.rawValue)
        XCTAssertTrue(duration.exists)
        XCTAssertEqual(duration.label,"2006 - 2009")
    }
}
