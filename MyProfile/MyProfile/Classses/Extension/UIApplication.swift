//
//  UIApplication.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit

extension UIApplication {
    private func canOpenURL(string: String) -> Bool {
        guard let url = URL(string: string) else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }
    
    private func openURL(string: String) {
        guard let url = URL(string: string) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
