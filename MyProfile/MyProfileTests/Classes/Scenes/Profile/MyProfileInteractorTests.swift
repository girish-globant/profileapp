//
//  MyProfileInteractorTests.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import XCTest

class MyProfileInteractorTests: XCTestCase {
    var sut: MyProfileInteractor!
    lazy var myProfileInteractorOutputSpy = MyProfileInteractorOutputSpy()
    var networkSessionMock: NetworkSessionMock?

    override func setUp() {
        configure()
    }
    override func tearDown() {
        networkSessionMock = nil
        sut = nil

    }
    func configure() {
        sut = MyProfileInteractor()
        sut.presenter = myProfileInteractorOutputSpy
    }
    
    func testFetchProfileResult() {
        let data = NetworkSessionHelper.getResponseData()
        let response = NetworkSessionHelper.getUrlResponse(responseType: .success)
        let session =  NetworkSessionMock.init(data: data, response: response, error: nil)
        
        sut.myProfileWorker.apiManager = APIManager.init(session: session)
        sut.fetchProfile()
        XCTAssert(myProfileInteractorOutputSpy.presentFetchProfileResultCalled, "presentFetchProfileResultCalled() should have been called")
    }
    
    func testPresentFetchProfileFail() {
        let error = NetworkSessionHelper.getError()
        let response = NetworkSessionHelper.getUrlResponse(responseType: .fail)
        let session =  NetworkSessionMock.init(data: nil, response: response, error: error)
        
        sut.myProfileWorker.apiManager = APIManager.init(session: session)
        sut.fetchProfile()
        XCTAssert(myProfileInteractorOutputSpy.presentFetchProfileFailCalled, "presentFetchProfileFailCalled() should have been called")
    }
    
    class MyProfileInteractorOutputSpy: MyProfileInteractorPresenterInterface {
        
        var presentFetchProfileResultCalled = false
        var presentFetchProfileFailCalled = false
        
        func presentFetchProfileResult(myProfileModel: MyProfileModel) {
            presentFetchProfileResultCalled = true
        }
        
        func presentFetchProfileFail(error: Error) {
            presentFetchProfileFailCalled = true
        }
    }    
}
