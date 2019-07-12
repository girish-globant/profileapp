//
//  MyProfileConfigurator.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
class MyProfileConfigurator {
    /// Create all required objects using dependency injections
    ///
    /// - Parameters:
    ///   - viewController: Reference of MyProfileViewController
    func configure(viewController: MyProfileViewController) {
        let presenter = MyProfilePresenter()
        presenter.controller = viewController

        let interactor = MyProfileInteractor()
        interactor.presenter = presenter

        viewController.interactor = interactor
    }
}
