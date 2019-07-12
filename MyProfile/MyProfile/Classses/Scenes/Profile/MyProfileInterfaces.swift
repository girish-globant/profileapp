//
//  MyProfileInterfaces.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation

/// Protocol for Interactor. This protocol need to be extended to fetch profile information from server.
protocol MyProfileViewControllerInteractorInterface: class {
    var presenter: MyProfileInteractorPresenterInterface? { get set }
    func fetchProfile()
}

/// Protocol for Presenter. This protocol need to be extended to pass success or fail message to view
///
/// - Parameters:
///   - message: Error message to be displayed
protocol MyProfileInteractorPresenterInterface: class {
    /// Result pass back to view to display it on UI
    ///
    /// - Parameters:
    ///   - myProfileModel: Used to display profile information
    func presentFetchProfileResult(myProfileModel: MyProfileModel)
    
    /// Result pass back to view to display error message
    /// - Parameters:
    ///   - error: Used to display error message
    func presentFetchProfileFail(error: Error)
}

/// Protocol for View. This protocol need to be extended to display success or fail message to view
///
/// - Parameters:
///   - message: Error message to be displayed

protocol MyProfilePresenterViewControllerInterface: class {
    /// Called after API executes successfully
    ///
    /// - Parameters:
    ///   - myProfileModel: Used to display profile information
    func displayFetchProfile(myProfileModel: MyProfileModel)
    
    /// Display error message if API execution get failed
    func displayFetchProfileFail(error: Error)
}

/// Protocol for alert view. This protocol need to be extended to display alert message from any class
protocol AlertDelegate: class {
    func showAlert(message: String)
}


