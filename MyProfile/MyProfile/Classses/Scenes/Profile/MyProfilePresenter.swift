//
//  MyProfilePresenter.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
class MyProfilePresenter:MyProfileInteractorPresenterInterface {

    weak var controller: MyProfilePresenterViewControllerInterface?

    /// Result pass back to view to display it on UI
    ///
    /// - Parameters:
    ///   - myProfileModel: Used to display profile information
    func presentFetchProfileResult(myProfileModel: MyProfileModel) {
        controller?.displayFetchProfile(myProfileModel: myProfileModel)
    }

    /// Result pass back to view to display error message
    /// - Parameters:
    ///   - error: Used to display error message
    func presentFetchProfileFail(error: Error) {
        controller?.displayFetchProfileFail(error: error)
    }
}
