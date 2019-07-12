//
//  URLSession.swift
//  MyProfile
//
//  Created by Girish Muchalambe on 01/07/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation

protocol NetworkSession {
    func loadData(from request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func loadData(from request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: request) { (data, response, error) in
            completionHandler(data, response, error)
        }
        task.resume()
    }
}
