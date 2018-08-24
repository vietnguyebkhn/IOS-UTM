//
//  CommentViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/23/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mTableView: UITableView!
    
    var commentList: ListCommentVO?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (commentList?.list == nil) {
            return 0
        }
        return commentList!.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.setData(data: commentList!.list[indexPath.row])
        return cell
    }
    
    func requestComment() {
        Service.requestComment() {[weak self] (error, dataResponse) in
            guard let strongSelf = self else {
                return
            }
            if error != nil {
                let alert = UIAlertController(title: "Thong Bao", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                    
                }))
            } else {
                strongSelf.commentList = dataResponse
                strongSelf.mTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
mTableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        requestComment()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestComment()
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
