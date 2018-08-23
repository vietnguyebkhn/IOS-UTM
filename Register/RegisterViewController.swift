//
//  RegisterViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/22/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import  TweeTextField
import CoreData

class RegisterViewController: UIViewController {
    
    
//    @IBOutlet weak var mPasswordIc: UIImageView!
//    @IBOutlet weak var mPasswordIcon: UIImageView!
//    @IBOutlet weak var mEmailIcon: UIImageView!
//    @IBOutlet weak var mAccountIcon: UIImageView!
//    @IBOutlet weak var mBackground: UIImageView!
    
    @IBAction func mbackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var mNoticePassword: UILabel!
    @IBOutlet weak var mNoticeConfirmPassword: UILabel!
    @IBOutlet weak var mNoticeEmail: UILabel!
    @IBOutlet weak var mNoticeUser: UILabel!
    @IBOutlet weak var mConfirmPassword: TweeActiveTextField!
    @IBOutlet weak var mEmail: TweeActiveTextField!
    @IBOutlet weak var mUsername: TweeActiveTextField!
    
    @IBOutlet weak var mPassword: TweeActiveTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
//        let MainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let Main = MainStoryboard.instantiateViewController(withIdentifier: "MainStoryboard") as! ViewController
//        self.navigationController?.pushViewController(Main, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mRegister(_ sender: Any) {
        
        if mUsername.text == "" {
            mNoticeUser.text = "Nhập User name!!!"
        }
        if mPassword.text == "" {
            mNoticePassword.text = "Nhập Password"
        }
        if mEmail.text == "" {
            mNoticeEmail.text = "Nhập Email"
        } else if ((mUsername.text?.count)! < 6  ) {
            mNoticeUser.text = "User phải có tối thiểu 6 kí tự"
        } else if ((mPassword.text?.count)! < 8) {
        mNoticePassword.text = "Password phải có tối thiểu 8 ký tự"
        }
        else  if mPassword.text != mConfirmPassword.text {
            mNoticeConfirmPassword.text = "Mật khẩu không khớp"
        } else {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var newAccount = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context)
            
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
            for result in results as! [NSManagedObject] {
                if  let username = result.value(forKey: "username") as? String,
                    let email = result.value(forKey: "email") as? String {
                    
                   if (mUsername.text == username ) {
                        mNoticeUser.text = "Tài khoản đã tồn tại"
                    } else if (mEmail.text == email) {
                        mNoticeEmail.text = "Email đã tồn tại"
                   }
                   else {
                    
                    newAccount.setValue(mUsername.text, forKey: "username")
                    newAccount.setValue(mEmail.text, forKey: "email")
                    newAccount.setValue(mPassword.text, forKey: "password")
                    try context.save()
                    
                    let alert = UIAlertController(title: "Notification", message: "Register Sucess", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        let HomeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                        let Home = HomeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        self.present(Home, animated: true, completion: nil)
                        
                        //  self.navigationController?.pushViewController(Home, animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                    }
                    break
                }
            }
            }
        } catch {
            //Proccess error
        }
        
       
    }
    
    
//    @IBAction func mEditingUser(_ sender: Any) {
//        mNoticeUser.text = ""
//    }
//
//    @IBAction func mEditingEmail(_ sender: Any) {
//        mNoticeEmail.text = ""
//    }
//
//    @IBAction func mEditingPassword(_ sender: Any) {
//        mNoticeConfirmPassword.text = ""
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
