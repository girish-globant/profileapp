//
//  MyProfileViewController.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import UIKit
enum InformationType: Int, CaseIterable{
    case PersonalInfo
    case ProfessionalSummary
    case WorkExperience
    case Education
}

class MyProfileViewController: UIViewController {
    @IBOutlet weak var profileTableView: UITableView?
    var interactor: MyProfileViewControllerInteractorInterface?
    private var myProfileModel: MyProfileModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        MyProfileConfigurator().configure(viewController: self)
    }
    override func viewDidLoad() {
        setupView()
    }
    
    /// Do initial view setup and fetch profile using API
    private func setupView(){
        profileTableView?.rowHeight = UITableView.automaticDimension
        profileTableView?.estimatedRowHeight = UITableView.automaticDimension
        profileTableView?.tableFooterView = UIView()
        profileTableView?.accessibilityIdentifier = Constanst.AccessIdentifiers.profileTableView
        profileTableView?.register(CustomSectionHeader.self, forHeaderFooterViewReuseIdentifier: "CustomSectionHeader")

        fetchProfile()
    }
    private func fetchProfile(){
        showLoading(message: NSLocalizedString(Constanst.Messages.LOADING_MESSAGE, comment: ""))
        interactor?.fetchProfile()
    }
}

extension MyProfileViewController: MyProfilePresenterViewControllerInterface {
    /// Display error message if API execution get failed
    func displayFetchProfileFail(error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.myProfileModel = nil
            self?.hideLoading()
            guard let overlay = UINib.errorMessageOverlay as? ErrorMessageView else { return }
            overlay.translatesAutoresizingMaskIntoConstraints = false
            guard let parentView = self?.view else {
                return
            }
            overlay.errorMessage = error.domain
            overlay.errorMessageDelegate = self
            self?.view.addSubview(overlay)
            
            NSLayoutConstraint.activate([
                overlay.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0),
                overlay.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 0),
                overlay.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0),
                overlay.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0)
            ])
        }
    }
    
    /// Called after API executes successfully
    ///
    /// - Parameters:
    ///   - myProfileModel: Used to display profile information
    func displayFetchProfile(myProfileModel: MyProfileModel) {
        hideLoading()
        self.myProfileModel = myProfileModel
        DispatchQueue.main.async { [weak self] in
            self?.profileTableView?.reloadData()
        }
    }
}
extension MyProfileViewController:UITableViewDataSource{
    
    /// Display section title for each information type e.g. Summary, Work Experience etc
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var sectionTitle: String{
            switch section{
            case InformationType.ProfessionalSummary.rawValue:
                return Constanst.ProfileHeading.SUMMARY
            
            case InformationType.WorkExperience.rawValue:
                return Constanst.ProfileHeading.WORK_EXPERIENCE
                
            case InformationType.Education.rawValue:
                return Constanst.ProfileHeading.EDUCATION
                
            default:
                return ""
            }
        
        }
        let view = profileTableView?.dequeueReusableHeaderFooterView(withIdentifier:"CustomSectionHeader") as? CustomSectionHeader
        view?.titleLabel.text = sectionTitle
        return view
    }
    
    /// Number of section in table. Default is 4
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let _ = self.myProfileModel else {return 0}
        return InformationType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case InformationType.WorkExperience.rawValue:
            return myProfileModel?.workExperience?.companies?.count ?? 0
        case InformationType.Education.rawValue:
            return myProfileModel?.education?.courses?.count ?? 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case InformationType.PersonalInfo.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constanst.Identifier.TableCell.PERSONALINFOCELL, for: indexPath) as? PersonalInfoCell else {
                return UITableViewCell()
            }
            cell.personalInfo = myProfileModel?.personalInfo
            cell.alertDelegate = self
            return cell
        
        case InformationType.ProfessionalSummary.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constanst.Identifier.TableCell.PROFESSIONALSUMMARYCELL, for: indexPath) as? ProfessionalSummaryCell else {
                return UITableViewCell()
            }
            cell.professionalSummary = myProfileModel?.professionalSummary
            return cell
            
        case InformationType.WorkExperience.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constanst.Identifier.TableCell.COMPANYCELL, for: indexPath) as? CompanyCell else {
                return UITableViewCell()
            }
            cell.company = myProfileModel?.workExperience?.companies?[indexPath.row]
            return cell
            
        case InformationType.Education.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constanst.Identifier.TableCell.EDUCATIONCELL, for: indexPath) as? EducationCell else {
                return UITableViewCell()
            }
            cell.course = myProfileModel?.education?.courses?[indexPath.row]
            return cell
        
        default:
            return UITableViewCell()
        }
        
    }
}
extension MyProfileViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == InformationType.PersonalInfo.rawValue ? 0.1 : 30.0
    }
}
extension MyProfileViewController:ErrorMessageDelegate{
    
    /// Fetch profile again after API execution fail
    func tryAgain() {
        fetchProfile()
    }
}
extension MyProfileViewController: AlertDelegate{
    func showAlert(message: String) {
           alert(message: message)
    }
}
