//
//  LoadJsonOffViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class LoadJsonOffViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    var arrData:[JsonOffVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.register(UINib(nibName: "JsonOffTableViewCell", bundle: nil), forCellReuseIdentifier: "JsonOffTableViewCell")
        loadDataLocal()
        mTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataLocal() {
        if let path = Bundle.main.path(forResource: "jsonoffdata", ofType: "json")
        {
            do {
                let jsonoffdata = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: jsonoffdata, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["jsonoffdata"] as? [Any] {
                    for item in listData {
                        let i = JsonOffVO(jsonoffdata: item as! [String : AnyObject])
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonOffTableViewCell", for: indexPath) as! JsonOffTableViewCell
        cell.setDataJsonOff(jsonoffdata: arrData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
