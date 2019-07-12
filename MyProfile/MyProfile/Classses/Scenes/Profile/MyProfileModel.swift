//
//  MyProfileModel.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
struct MyProfileModel: Codable {
    let personalInfo: PersonalInfo?
    let professionalSummary: ProfessionalSummary?
    let workExperience: WorkExperience?
    let education: Education?
}
struct PersonalInfo: Codable {
    let fullname: String
    let email: String
    let mobile: String
    let jobRole: String?
}
struct ProfessionalSummary: Codable {
    let description: String
    let skillset:[String]
}
struct WorkExperience: Codable {
    let companies: [Company]?
}
struct Company: Codable{
    let name: String
    let designation: String
    let duration: String
    let website: String
    let jobSummery: String
}
struct Education: Codable {
    let courses: [Course]?
}
struct Course: Codable {
    let university: String
    let courseName: String
    let duration: String
}

 
