//
//  NetworkSessionMock.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import Foundation
class NetworkSessionMock: NetworkSession {
    
    var data: Data?
    var error: Error?
    var response: URLResponse?
    var isRequesting: Bool = false
    
    init() {
        
    }
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.error = error
        self.response = response
    }
    
    func loadData(from request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        isRequesting = true
        completionHandler(data, response, error)
    }
}

