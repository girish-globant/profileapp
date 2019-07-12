//
//  ProfessionalSummaryCell.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit

class ProfessionalSummaryCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel?
    var professionalSummary: ProfessionalSummary? {
        didSet {
            guard let professionalSummary = professionalSummary else { return }
            descriptionLabel?.text = professionalSummary.description
        }
    }
}
