//
//  HomeViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/22/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrData: [HomeSampleVO] = []
    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        loadDataLocal()
        // Do any additional setup after loading the view.
    }
    
    func loadDataLocal() {
        if let path = Bundle.main.path(forResource: "homedata", ofType: "json")
        {
            do {
                let homedata = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: homedata, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["homedata"] as? [Any] {
                    for item in listData {
                        let i = HomeSampleVO(homedata: item as! [String : AnyObject])
                        arrData.append(i)
                    }
                    
                    mTableView.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.setData(homedata: arrData[indexPath.row])
        if ( indexPath.row % 2 == 0 ) {
            cell.backgroundColor = UIColor(red: 54, green: 102, blue: 167, alpha: 0.81)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let changeScr = UIStoryboard(name: "StaticTableViewCell", bundle: nil)
//        let ChangeScr = changeScr.instantiateViewController(withIdentifier: "changeScreenSBid") as! IphoneViewController
//        self.present(ChangeScr, animated: true, completion: nil)
//        print(indexPath.row)
                if (indexPath.row == 0) {
        let staticTableViewCellSB = UIStoryboard(name: "StaticTableViewCell", bundle: nil)
        let ipphoneVC = staticTableViewCellSB.instantiateViewController(withIdentifier: "testIphoneVC")
       // print("navigation = \(self.navigationController)")
        self.navigationController?.pushViewController(ipphoneVC, animated: true)
       // present(ipphoneVC, animated: true, completion: nil)
                } else if (indexPath.row == 1) {
                    let DynamicSB = UIStoryboard(name: "DynamicTableViewCell", bundle: nil)
                    let ChangeDynamicSB = DynamicSB.instantiateViewController(withIdentifier: "DynamicTableViewCell")
                    // print("navigation = \(self.navigationController)")
                    self.navigationController?.pushViewController(ChangeDynamicSB, animated: true)
                } else if (indexPath.row == 2) {
                    let DynamicSB = UIStoryboard(name: "LoadJsonOffline", bundle: nil)
                    let ChangeDynamicSB = DynamicSB.instantiateViewController(withIdentifier: "LoadJsonOffline")
                    // print("navigation = \(self.navigationController)")
                    self.navigationController?.pushViewController(ChangeDynamicSB, animated: true)
        }
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
