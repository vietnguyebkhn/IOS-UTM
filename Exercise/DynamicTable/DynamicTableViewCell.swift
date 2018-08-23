//
//  DynamicTableViewCell.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var mLabel: UILabel!
    
    func setData(iphone: String) {
        mLabel.text = iphone
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
