//
//  MyProfileModelMock.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import Foundation
class MyProfileModelMock {
    static func mockResponse()-> MyProfileModel? {
        let responseData = FileUtil(fileName: "profile_ok").getData()
        
        do {
            let decoder = JSONDecoder()
            guard let profileData = responseData else {
                return nil
            }
            let myProfileModel:MyProfileModel = try decoder.decode(MyProfileModel.self, from: profileData)
            return myProfileModel
            
        }catch _ {
        }
        return nil
    }
}
