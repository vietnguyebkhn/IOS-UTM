//
//  JsonOffVO.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class JsonOffVO {
    var title = ""
    var detail = ""
    init(jsonoffdata: [String: AnyObject]) {
        title = jsonoffdata["title"] as? String ?? ""
        detail = jsonoffdata["detail"] as? String ?? ""
    }
}
