//
//  EndpointMock.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import Foundation

internal enum EndpointMock: APIEndpoint
{
    case getMockRequest
    
    var pathFragment: String {
        switch self {
        case .getMockRequest: return "profile.json"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getMockRequest: return .get
        }
    }
}
