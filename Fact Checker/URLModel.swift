//
//  URLModel.swift
//  Fact Checker
//
//  Created by Raju on 27/3/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import Foundation

class URLModel: NSObject {
    
    var title: String?
    var body : String?
    var url : String?
    
    init(dictionary: [String: Any]) {
        super.init()
        title = dictionary["title"] as? String
        body = dictionary["body"] as? String
        url = dictionary["url"] as? String
    }
}
