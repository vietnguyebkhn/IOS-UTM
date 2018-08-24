//
//  JsonOnlineViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class JsonOnlineViewController: UIViewController {

    var commentData: ListCommentVO?
    override func viewDidLoad() {
        super.viewDidLoad()
        Service.requestComment {[weak self] (error, dataResponse) in
            guard let strongSelf = self else {
                return
            }
            
            if dataResponse != nil {
                strongSelf.commentData = dataResponse
                //                strongSelf.mLabel.text = dataResponse!.name
            } else if error != nil {
                let alert = UIAlertController(title: "Thong bao", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dong y", style: .cancel, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
