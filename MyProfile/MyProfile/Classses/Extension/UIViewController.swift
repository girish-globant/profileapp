//
//  UIViewController.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 26/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    /// Show loading view until API execution finish or asynchronous task finish
    ///
    /// - Parameters:
    ///   - message: Loading message to be displayed. Defualt will be "Please wait..."
    func showLoading(message: String = Constanst.Messages.LOADING_MESSAGE){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.widthAnchor.constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 50),
            loadingIndicator.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor),
            loadingIndicator.leftAnchor.constraint(equalTo: alert.view.leftAnchor, constant: 10)
            ])
        DispatchQueue.main.async {[weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideLoading(){
        DispatchQueue.main.async {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    /// Show system alert view
    ///
    /// - Parameters:
    ///   - message: Message displayed over alert
    func alert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {[weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

