//
//  WorkExperience.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//
import UIKit

class CompanyCell: UITableViewCell {
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var designation: UILabel?
    @IBOutlet weak var durationLbl: UILabel?
    @IBOutlet weak var websiteBtn: UIButton?
    @IBOutlet weak var jobSummeryLbl: UILabel?
    
    var company: Company? {
        didSet {
            guard let company = company else { return }
            name?.text = company.name
            designation?.text = company.designation
            durationLbl?.text = company.duration
            websiteBtn?.setTitle(company.website, for: .normal)
            jobSummeryLbl?.text = company.jobSummery
        }
    }
    
    @IBAction func openWebsite(_ sender: UIButton) {
        guard let company = company, let websiteURL = URL(string: company.website) else { return }
        if UIApplication.shared.canOpenURL(websiteURL) {
            UIApplication.shared.open(websiteURL)
        }
    }
}
