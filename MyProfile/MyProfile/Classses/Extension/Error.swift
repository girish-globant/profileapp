//
//  Error.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 01/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
