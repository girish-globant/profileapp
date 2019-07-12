//
//  MyProfileInteractor.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
class MyProfileInteractor:MyProfileViewControllerInteractorInterface {
    var presenter: MyProfileInteractorPresenterInterface?
    lazy var myProfileWorker = MyProfileWorker()
    
    /// Fetch profile from server. Result pass back to presenter
    func fetchProfile() {
        myProfileWorker.fetchProfile {[weak self] (response)  in
            switch response {
            case .success(let profileModel):
                
                guard let profileModel = profileModel as? MyProfileModel else {
                    let error = NSError(domain: NSLocalizedString(Constanst.Messages.API_FAILED_ERROR, comment: ""), code: -1)
                    self?.presenter?.presentFetchProfileFail(error: error)
                    return
                }
                self?.presenter?.presentFetchProfileResult(myProfileModel: profileModel)
                break
            case .failure(let error):
                self?.presenter?.presentFetchProfileFail(error: error)
                break
            }
        }
    }
    
}
