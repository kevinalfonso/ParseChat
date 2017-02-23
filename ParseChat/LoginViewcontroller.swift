//
//  ViewController.swift
//  ParseChat
//
//  Created by Kevin Alfonso on 2/22/17.
//  Copyright © 2017 Kevin Alfonso. All rights reserved.
//

import UIKit
import Parse 

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signUp() {
        let user = PFUser()
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground(block: success: Bool, error: NSError)
        
//        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("User Registered successfully")
//                // manually segue to logged in view
//            }
//        }
    }
    
    


}

