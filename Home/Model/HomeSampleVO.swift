//
//  HomeSampleVO.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class HomeSampleVO {
    var image = ""
    var name = ""
    var identify = ""
    
    init(homedata: [String: AnyObject]) {
        image = homedata["image"] as? String ?? ""
        name = homedata["name"] as? String ?? ""
        identify = homedata["identify"] as? String ?? ""
    }
}
