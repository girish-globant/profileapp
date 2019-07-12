//
//  EducationCell.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit

class EducationCell: UITableViewCell {
    @IBOutlet weak var universityLbl: UILabel?
    @IBOutlet weak var courseNameLbl: UILabel?
    @IBOutlet weak var durationLbl: UILabel?
    
    var course: Course? {
        didSet {
            guard let course = course else { return }
            universityLbl?.text = course.university
            courseNameLbl?.text = course.courseName
            durationLbl?.text = course.duration
        }
    }
}
