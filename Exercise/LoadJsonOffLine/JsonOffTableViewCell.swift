//
//  JsonOffTableViewCell.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class JsonOffTableViewCell: UITableViewCell {

    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setDataJsonOff(jsonoffdata: JsonOffVO) {
        mTitle.text = jsonoffdata.title
       mDetail.text = jsonoffdata.detail
      //  mDetail2.text = jsonoffdata.detail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
