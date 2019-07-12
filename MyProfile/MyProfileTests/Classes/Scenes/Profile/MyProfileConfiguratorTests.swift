//
//  MyProfileConfiguratorTests.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 28/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

@testable import MyProfile
import XCTest

class MyProfileConfiguratorTests: XCTestCase {
    
    func testConfigure() {
        let myProfileViewController = MyProfileViewController()
        MyProfileConfigurator().configure(viewController: myProfileViewController)
        
        XCTAssert(myProfileViewController.interactor != nil , "Interactor is created successfully")
        XCTAssert(myProfileViewController.interactor?.presenter != nil , "Presenter is created successfully")
    }
}
