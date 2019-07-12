//
//  APIManagerTests.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import XCTest

class APIManagerTests: XCTestCase {
    
    var apiManager: APIManager!

    override func setUp() {
        
    }
    
    func testRequestURL() {
        let session = NetworkSessionMock()
        apiManager = APIManager(session: session)
        let endpoint = EndpointMock.getMockRequest
        apiManager.request(from: endpoint) { (response) in }
        XCTAssertTrue(session.isRequesting)
    }
    
    func testAPIManagerSuccess() {
        let apiManagerSuccess = expectation(description: "apimanagersuccess")
        let expectedData = "[{}]".data(using: .utf8)
        
        let response = NetworkSessionHelper.getUrlResponse(responseType: .success)
        let session = NetworkSessionMock.init(data: expectedData, response: response, error: nil)
        apiManager = APIManager(session: session)
        let endpoint = EndpointMock.getMockRequest
        apiManager.request(from: endpoint) { (response) in
            switch response {
            case .failure( _):
                XCTFail("Fail error not expected")
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertEqual(data, expectedData)
            }
            apiManagerSuccess.fulfill()
        }
        waitForExpectations(timeout: 10) { error in
            guard let _ = error else{ return }
            XCTFail("Expectation Failure")
        }
    }
    
    func testAPIManagerFail() {
        let apiManagerFail = expectation(description: "apimanagerfail")
        let error = NetworkSessionHelper.getError()
        let response = NetworkSessionHelper.getUrlResponse(responseType: .fail)
        let session = NetworkSessionMock.init(data: nil, response: response, error: error)
        apiManager = APIManager(session: session)
        let endpoint = EndpointMock.getMockRequest
        apiManager.request(from: endpoint) { (response) in
            switch response {
            case .failure(let error):
                var errorString : String{
                    return !Reachability.isConnectedToNetwork() ?
                    NSLocalizedString(Constanst.Messages.NO_INTERNET_CONNECTION, comment: "") : NSLocalizedString(Constanst.Messages.API_FAILED_ERROR, comment: "")
                }
                XCTAssertEqual(error.domain, errorString)
                XCTAssertEqual(error.code, 400)
            case .success( _):
                XCTFail("Fail data not expected")
            }
            apiManagerFail.fulfill()
        }
        waitForExpectations(timeout: 10) { error in
            guard let _ = error else{ return }
            XCTFail("Expectation Failure")
        }
    }
}
