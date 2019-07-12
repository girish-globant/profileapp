//
//  MyProfileWorker.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 02/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import Foundation
class MyProfileWorkerMock : MyProfileWorker{
    var networkSessionMock: NetworkSessionMock?
    
    
     func mockWorkSuccessResponse(completionHandler: @escaping (APIResult<Any>) -> Void){
        let endpoint = ProfileEndpoint.getProfile
        let data = NetworkSessionHelper.getResponseData()
        let response = NetworkSessionHelper.getUrlResponse(responseType: .success)
        let session =  NetworkSessionMock.init(data: data, response: response, error: nil)

        apiManager = APIManager.init(session: session)
        apiManager.request(from: endpoint) {[weak self] (response) in
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
    
}
