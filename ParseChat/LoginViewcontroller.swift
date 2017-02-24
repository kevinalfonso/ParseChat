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
    
    @IBAction func signUp(_ sender: Any) {
        let user = PFUser()
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                self.showAlert(errorMsg: error.localizedDescription)
            } else {
                // Hooray! Let them use the app now.
                //self.loginSegue()
            }
            
        }
    }

    @IBAction func logIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (succedded: PFUser?, error: Error?) -> Void in
            if let error = error {
                self.showAlert(errorMsg: error.localizedDescription)
            } else {
                // Hooray! Let them use the app now.
                self.loginSegue()
            }
        }
    }
    
    func showAlert(errorMsg: String) {
        let alertController = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true) {
            
        }
    }
    
    func loginSegue(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NavigationController")
        self.present(vc, animated: true, completion: nil)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

