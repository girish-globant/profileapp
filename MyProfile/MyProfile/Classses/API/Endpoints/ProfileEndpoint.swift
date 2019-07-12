//
//  ProfileEndpoint.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

internal enum ProfileEndpoint: APIEndpoint
 {
    case getProfile
    
    var pathFragment: String {
        switch self {
        case .getProfile: return "profile.json"
        }
    }

    var method: RequestMethod {
        switch self {
        case .getProfile: return .get
        }
    }
}
