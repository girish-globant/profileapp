//
//  UINib.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit
extension UINib {
    static func view(named name: String) -> UIView? {
        return UINib(nibName: name, bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first
            as? UIView
    }
    
    /// Show error message overlay
    static var errorMessageOverlay: UIView? {
        return view(named: Constanst.Identifier.View.ERRORMESSAGEVIEW)
    }
}
