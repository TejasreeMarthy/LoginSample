//
//  LoginViewController.swift
//  LoginSample
//
//  Created by Tejasree Marthy on 19/04/19.
//  Copyright © 2019 Tejasree Marthy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtextField:UITextField!
    @IBOutlet weak var passwordtextField:UITextField!
    @IBOutlet weak var loginButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginMethod(_ sender: Any) {
        validateTextFields()
    }
    func validateTextFields() {
        
        if (emailtextField.text?.count == 0) {
            displayAlert(title: "Email Empty", message: "Email should not be empty")
            return
        }else if (isValidEmail(email: emailtextField.text ?? "") == false) {
            displayAlert(title: "Invalid Email", message: "Please enter valid emailid")
          return
        }else if (passwordtextField.text?.count == 0) {
            displayAlert(title: "Password Empty", message: "Password should not be empty")
            return
        }
        else {
            displayAlert(title: "Success!!!", message: "Login success")
        }
    }
    
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func displayAlert(title:String,message:String) {
  
        let alert = UIAlertController(title:title, message:message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}

