//
//  NetworkSessionHelper.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
enum ResponseType {
    case success
    case fail
}
class NetworkSessionHelper{

    static func getUrlResponse(responseType: ResponseType) -> URLResponse {
        let statusCode = responseType == .success  ? 200 : 400
        return HTTPURLResponse(url: URL(string: "https://mockresponse.com")!, statusCode: statusCode, httpVersion: "HTTP/1.1", headerFields: nil)!
    }
    
    static func getResponseData()->Data?{
        let responseData = FileUtil(fileName: "profile_ok").getData()
        return responseData
    }
    
    static func getError()->Error{
        return NSError(domain: "Something went wrong...please try again", code:  400)
    }
}
