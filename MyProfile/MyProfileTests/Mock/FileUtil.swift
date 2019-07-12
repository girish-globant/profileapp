//
//  FileUtil.swift
//  MyProfileTests
//
//  Created by Girish Muchalambe on 27/06/19.
//  Copyright © 2019 Girish Muchalambe. All rights reserved.
//

import Foundation

public class FileUtil {
    
    var fileName : String!
    var ext : String!
    
    public init(fileName : String!, ext : String! = "json") {
        self.fileName = fileName
        self.ext = ext
    }
    
    public func getData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: fileName, ofType: ext)!
        
        var data : Data?
        
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        } catch let error {
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
        
        return data
    }
}
