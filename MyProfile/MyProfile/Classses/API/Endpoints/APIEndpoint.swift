//
//  APIEndpoint.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation

internal protocol APIEndpoint {
    var pathFragment: String { get }
    var method: RequestMethod { get }
}
