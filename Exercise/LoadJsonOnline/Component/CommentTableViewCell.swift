//
//  CommentTableViewCell.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
   
    

    @IBOutlet weak var mBody: UILabel!
    @IBOutlet weak var mEmail: UILabel!
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mId: UILabel!
    @IBOutlet weak var mPostId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: [String: AnyObject]) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
