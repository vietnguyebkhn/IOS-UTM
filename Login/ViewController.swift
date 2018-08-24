//
//  ViewController.swift
//  Login
//
//  Created by Nguyễn Việt on 8/22/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    

    
    @IBAction func mGoogleTouched(_ sender: Any) {
        
    }
    @IBAction func mTwitterTouched(_ sender: Any) {
        
    }
    @IBAction func mFacebookBtTouched(_ sender: Any) {
        
    }
    @IBAction func mRegisterTouched(_ sender: Any) {
        let RegisterViewController: UIStoryboard = UIStoryboard(name: "Register", bundle: nil)
        let Register = RegisterViewController.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
       // present(Register, animated: true, completion: nil)
       self.navigationController?.pushViewController(Register, animated: true)
    }
    
    @IBAction func mLoginTouched(_ sender: Any) {
        
        
        var message = ""
        
        if  checkValid(userName: mUsername.text!, passWord: mPasswordTxt.text!) == false {
            message = "Wrong username or password "
        } else {
            let HomeStoryBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let Home = HomeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(Home, animated: true)
       //   present(Home, animated: true, completion: nil)

          //  self.navigationController?.pushViewController(Home, animated: true)
        }
        if mUsername.text == "" {
            mNoticeUsername.text = "Nhập User name!!!"
        } else if mPasswordTxt.text == "" {
            mNoticePassword.text = "Nhập Password"
        }
        
        if message != "" {
            var alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func mEditingUser(_ sender: Any) {
        mNoticeUsername.text = ""
    }
    @IBAction func mEditingPassword(_ sender: Any) {
        mNoticePassword.text = ""
    }
    
    @IBOutlet weak var mNoticePassword: UILabel!
    @IBOutlet weak var mNoticeUsername: UILabel!
    @IBOutlet weak var mPasswordImg: UIImageView!
    @IBOutlet weak var mPasswordTxt: TweeAttributedTextField!
    @IBOutlet weak var mAccountImg: UIImageView!
    @IBOutlet weak var mUsername: TweeAttributedTextField!
    var backgroundPlayer : BackgroundVideo?

    override func viewDidLoad() {
        super.viewDidLoad()
         self.hideKeyboardWhenTappedAround()
        removeBorderNavigation()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundPlayer = BackgroundVideo(on: self, withVideoURL: "Rain_Fire.mp4") // Passing self and video name with extension
        backgroundPlayer?.setUpBackground()
        
        // Store Core Data
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkValid(userName: String, passWord: String) -> Bool {
        var bool: Bool = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
 //       let newUser = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context)
        let request =  NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if  let username = result.value(forKey: "username") as? String,
                        let password = result.value(forKey: "password") as? String{
                        if (username == userName && password == passWord ) {
                            return true
                        } else {
                            continue
                        }
                        
                    }
                    
                }
            }
        } catch {
            
        }
        
        
        return false
    }
    func removeBorderNavigation()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

}

