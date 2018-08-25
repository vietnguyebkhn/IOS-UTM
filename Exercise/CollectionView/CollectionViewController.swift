//
//  CollectionViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/24/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    

    @IBOutlet weak var mCollectionViewCell: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
mCollectionViewCell.register(UINib(nibName: "CreateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CreateCollectionViewCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateCollectionViewCell", for: indexPath) as! CreateCollectionViewCell
         collectionCell.mImage.image = UIImage(named: "Ghoul")
        return collectionCell
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
