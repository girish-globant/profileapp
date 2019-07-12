//
//  MyProfilePresenterTests.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//


@testable import MyProfile
import XCTest

class MyProfilePresenterTests: XCTestCase {
    var sut: MyProfilePresenter!
    let myProfilePresenterOutputSpy = MyProfilePresenterOutputSpy()

    override func setUp() {
        configure()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func configure() {
        sut = MyProfilePresenter()
        sut.controller = myProfilePresenterOutputSpy
    }
    
    func testPresentFetchProfileResult(){
        var myProfileModel: MyProfileModel?
        let myProfileWorkerMock = MyProfileWorkerMock()
        
        myProfileWorkerMock.mockWorkSuccessResponse { (response) in
                switch response {
                case .success(let profileModel):
                    myProfileModel = profileModel as? MyProfileModel
                case .failure( _):
                    XCTFail("Mocking failed")
                    break
                }
            }
        
        guard let myProfileModelMock = myProfileModel else {
             XCTFail("Mocking failed")
            return
        }
        sut.presentFetchProfileResult(myProfileModel: myProfileModelMock)
        
        XCTAssert(myProfilePresenterOutputSpy.displayFetchProfileCalled, "displayFetchProfileCalled() should have been called")
        
        XCTAssert(myProfilePresenterOutputSpy.fetchProfileModel?.personalInfo?.fullname == "Girish Muchalambe", "Presenting fullname is not correct value")
        XCTAssert(myProfilePresenterOutputSpy.fetchProfileModel?.professionalSummary?.description == "Test professional summary", "Presenting professionalSummary is not correct value")
        XCTAssert(myProfilePresenterOutputSpy.fetchProfileModel?.workExperience?.companies?.count == 4, "Presenting workExperience is not correct value")
        XCTAssert(myProfilePresenterOutputSpy.fetchProfileModel?.education?.courses?.count == 2, "Presenting education is not correct value")
    }
    
    func testPresentFetchProfileFail(){
        let error = NetworkSessionHelper.getError()
        sut.presentFetchProfileFail(error: error)
        XCTAssert(myProfilePresenterOutputSpy.displayFetchProfileFailCalled, "displayFetchProfileFailCalled() should have been called")
        XCTAssert(myProfilePresenterOutputSpy.error?.domain == "Something went wrong...please try again", "Error domain is not correct value")
        XCTAssert(myProfilePresenterOutputSpy.error?.code == 400, "Error code is not correct value")
    }
    
    class MyProfilePresenterOutputSpy: MyProfilePresenterViewControllerInterface {
        var fetchProfileModel: MyProfileModel?
        var error: Error?
        
        var displayFetchProfileCalled = false
        var displayFetchProfileFailCalled = false
        
        func displayFetchProfile(myProfileModel: MyProfileModel) {
            displayFetchProfileCalled = true
            fetchProfileModel = myProfileModel
        }
        
        func displayFetchProfileFail(error: Error) {
            displayFetchProfileFailCalled = true
            self.error = error
        }

    }
}
