//
//  Service.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    let baseAPI = "https://jsonplaceholder.typicode.com/"
    var comment = "comments"
    
    func requestComment(complete: @escaping(_ error: Error?, _ resData: ListCommentVO?) -> Void ) {
        var requestURL = baseAPI + comment
        Alamofire.request(requestURL, method: .get, parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(let JSON):
                var commentListData: ListCommentVO?
                let result = JSON as? [[String: AnyObject]] ?? nil
                if result != nil {
                    commentListData = ListCommentVO(response: result!)
                }
                complete(nil, commentListData)
            case .failure(let error):
                complete(error, nil)
            }
        }
    }
}
