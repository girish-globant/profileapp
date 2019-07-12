//
//  Constants.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
struct Constanst{
    struct API {
        static let baseURL = "https://raw.githubusercontent.com/girish-globant/profileapp/master/"
    }
    struct ProfileHeading{
        static let SUMMARY =  NSLocalizedString(Constanst.Localization.SECTION_TITLE_SUMMARY, comment: "")
        static let SKILLS = NSLocalizedString(Constanst.Localization.SECTION_TITLE_SKILLS, comment: "")
        static let WORK_EXPERIENCE = NSLocalizedString(Constanst.Localization.SECTION_TITLE_WORK_EXPERIENCE, comment: "")
        static let EDUCATION = NSLocalizedString(Constanst.Localization.SECTION_TITLE_EDUCATION, comment: "")
    }
    struct Messages {
        static let API_FAILED_ERROR = NSLocalizedString(Constanst.Localization.API_FAILED_ERROR, comment: "")
        static let NO_INTERNET_CONNECTION = NSLocalizedString(Constanst.Localization.NO_INTERNET_CONNECTION, comment: "")
        static let EMAIL_APP_ERROR = NSLocalizedString(Constanst.Localization.EMAIL_APP_ERROR, comment: "")
        static let LOADING_MESSAGE = NSLocalizedString(Constanst.Localization.LOADING_MESSAGE, comment: "")
    }
    struct Identifier {
        struct TableCell {
            static let PERSONALINFOCELL = "PersonalInfoCell"
            static let PROFESSIONALSUMMARYCELL = "ProfessionalSummaryCell"
            static let COMPANYCELL = "CompanyCell"
            static let EDUCATIONCELL = "EducationCell"
        }
        struct View {
            static let ERRORMESSAGEVIEW = "ErrorMessageView"
        }
    }
    
    struct AccessIdentifiers{
        static let  profileTableView = "profileTableView"
    }
    
    struct Localization {
        static let  NO_INTERNET_CONNECTION = "noInternetConnection"
        static let  API_FAILED_ERROR = "APIFailed"
        static let  EMAIL_APP_ERROR = "emailAppError"
        static let  LOADING_MESSAGE = "loadingMessage"
        static let  SECTION_TITLE_SUMMARY = "sectionTitleSummary"
        static let  SECTION_TITLE_SKILLS = "sectionTitleSkills"
        static let  SECTION_TITLE_WORK_EXPERIENCE = "sectionTitleWorkExperience"
        static let  SECTION_TITLE_EDUCATION = "sectionTitleEducation"
    }
}
