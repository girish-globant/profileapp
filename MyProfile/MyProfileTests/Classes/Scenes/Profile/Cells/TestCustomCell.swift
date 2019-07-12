//
//  TestCustomCell.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 28/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import XCTest

class TestCustomCell: XCTestCase {
    var controller: MyProfileViewController!
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "MyProfileViewController") as? MyProfileViewController
        controller.loadViewIfNeeded()
    }

    override func tearDown() {
        controller = nil
    }
    
    func testCustomCell() {
        controller.profileTableView?.register(PersonalInfoCell.self, forCellReuseIdentifier: "PersonalInfoCell")
        let personalInfoCell: PersonalInfoCell = controller.profileTableView?.dequeueReusableCell(withIdentifier: "PersonalInfoCell") as! PersonalInfoCell
        XCTAssertNotNil(personalInfoCell, "No PersonalInfoCell Available")
        
        controller.profileTableView?.register(ProfessionalSummaryCell.self, forCellReuseIdentifier: "ProfessionalSummaryCell")
        let professionalSummaryCell: ProfessionalSummaryCell = controller.profileTableView?.dequeueReusableCell(withIdentifier: "ProfessionalSummaryCell") as! ProfessionalSummaryCell
        XCTAssertNotNil(professionalSummaryCell, "No ProfessionalSummaryCell Available")
        
        controller.profileTableView?.register(CompanyCell.self, forCellReuseIdentifier: "CompanyCell")
        let companyCell: CompanyCell = controller.profileTableView?.dequeueReusableCell(withIdentifier: "CompanyCell") as! CompanyCell
        XCTAssertNotNil(companyCell, "No CompanyCell Available")
        
        controller.profileTableView?.register(EducationCell.self, forCellReuseIdentifier: "EducationCell")
        let educationCell: EducationCell = controller.profileTableView?.dequeueReusableCell(withIdentifier: "EducationCell") as! EducationCell
        XCTAssertNotNil(educationCell, "No EducationCell Available")
    }

}
