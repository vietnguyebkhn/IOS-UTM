//
//  CommentVO.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class CommentVO {
    var postId = 1
    var id = 1
    var name = ""
    var email = ""
    var body = ""
    init(data: [String: AnyObject]) {
        postId = data["postId"] as? Int ?? 0
        id = data["id"] as? Int ?? 0
        name = data["name"] as? String ?? ""
        email = data["email"] as? String ?? ""
        body = data["body"] as? String ?? ""

    }
}
//
//"postId": 1,
//"id": 1,
//"name": "id labore ex et quam laborum",
//"email": "Eliseo@gardner.biz",
//"body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
//},
