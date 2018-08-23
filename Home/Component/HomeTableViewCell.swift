//
//  HomeTableViewCell.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

   
    @IBOutlet weak var mNameLb: UILabel!
    @IBOutlet weak var mImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(homedata: HomeSampleVO){
        mImage.image = UIImage(named: homedata.image)
        mNameLb.text = homedata.name
      //  mIdentify.text = homedata.identify
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
}
