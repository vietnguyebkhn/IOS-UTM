//
//  ListCommentVO.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class ListCommentVO {
    var list: [CommentVO]
    init(response: [[String: AnyObject]]) {
        var listTemp = [CommentVO]()
        for item in response {
            listTemp.append(CommentVO.init(data: item))
        }
        self.list = listTemp
    }
}
