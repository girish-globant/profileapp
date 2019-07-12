//
//  ErrorMessageView.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit
protocol ErrorMessageDelegate: class {
    func tryAgain()
}
class ErrorMessageView: UIView {
    @IBOutlet weak var errorMessageLbl: UILabel?
    weak var errorMessageDelegate: ErrorMessageDelegate?
    
    var errorMessage: String? {
        didSet {
            errorMessageLbl?.text = errorMessage
        }
    }

    /// Try again API call
    @IBAction func tryAgain(_ sender: UIButton) {
        removeFromSuperview()
        errorMessageDelegate?.tryAgain()
    }
}
