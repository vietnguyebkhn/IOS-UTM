//
//  IphoneViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class IphoneViewController: UIViewController, UITableViewDataSource {
    
    var arrData: [String] = ["IPhone 5","IPhone 6","IPhone 7","IPhone 8","IPhone X"]
    @IBOutlet weak var myTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let testIphoneCell = tableView.dequeueReusableCell(withIdentifier: "testIphoneCell", for: indexPath)
        testIphoneCell.textLabel?.text = arrData[indexPath.row]
        return testIphoneCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

   

}
