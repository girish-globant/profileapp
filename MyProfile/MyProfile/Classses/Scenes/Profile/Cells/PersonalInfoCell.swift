//
//  PersonalInfoCell.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit

class PersonalInfoCell: UITableViewCell {
    @IBOutlet weak var fullnameLbl: UILabel?
    @IBOutlet weak var emailBtn: UIButton?
    @IBOutlet weak var mobileLbl: UILabel?
    weak var alertDelegate: AlertDelegate?
    var personalInfo: PersonalInfo? {
        didSet {
            guard let personalInfo = personalInfo else { return }
            fullnameLbl?.text = personalInfo.fullname
            emailBtn?.setTitle(personalInfo.email, for: .normal)
            mobileLbl?.text = personalInfo.mobile
        }
    }
 
    @IBAction func openEmail(_ sender: UIButton) {
        guard let personalInfo = personalInfo, let emailURL = URL(string: "mailto:\(personalInfo.email)")  else {
            alertDelegate?.showAlert(message: NSLocalizedString(Constanst.Messages.EMAIL_APP_ERROR, comment: ""))
            return
        }
        if UIApplication.shared.canOpenURL(emailURL) {
            UIApplication.shared.open(emailURL)
        }else {
            alertDelegate?.showAlert(message:  NSLocalizedString(Constanst.Messages.EMAIL_APP_ERROR, comment: ""))
        }
    }
}
