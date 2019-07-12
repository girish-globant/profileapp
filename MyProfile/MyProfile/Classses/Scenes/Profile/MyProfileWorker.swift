//
//  MyProfileWorker.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
class MyProfileWorker{
    lazy var apiManager = APIManager()
    /// Fetch profile using API
    ///
    /// - Returns:
    ///     - APIResult - Return APIResult i.e. the parsed object on successful execution else error
    
    func fetchProfile(completionHandler: @escaping (APIResult<Any>) -> Void){
        let endpoint = ProfileEndpoint.getProfile
        
        apiManager.request(from: endpoint) { [weak self] (response) in
            switch response {
            case .success(let data):
                completionHandler(APIResult.success(self?.parseResponse(data: data)))
                break
            case .failure(let error):
               completionHandler(APIResult.failure(error))
                break
           }
        }
    }
    
    /// Parse the response data and returns MyProfileModel
    /// - Parameters:
    ///   - data: Response data from API execution
    /// - Returns:
    ///     - MyProfileModel - Object of MyProfileModel contains required objects for displaying profile information
    func parseResponse(data: Data?)-> MyProfileModel?{
        guard let profileData = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let myProfileModel:MyProfileModel = try decoder.decode(MyProfileModel.self, from: profileData)
            return myProfileModel
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
        return nil
    }
}
