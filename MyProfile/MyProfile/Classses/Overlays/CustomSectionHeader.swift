//
//  CustomSectionHeader.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 05/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
import UIKit
class CustomSectionHeader: UITableViewHeaderFooterView {
    let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        #if DEBUG
        fatalError("init(coder:) has not been implemented")
        #endif
    }
    
    func configureContents() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.sectionHeader
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
}
