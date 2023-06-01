//
//  ViewController.swift
//  Meri Money
//
//  Created by Prince Saini on 25/05/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var icPasswordToggle: UIImageView!
    @IBOutlet weak var icConfirmPasswordToggle: UIImageView!
    @IBOutlet weak var signInButton: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.isUserInteractionEnabled = true
        icPasswordToggle.isUserInteractionEnabled = true
        icConfirmPasswordToggle.isUserInteractionEnabled = true
        passwordTextField.isSecureTextEntry = true
        confirmTextField.isSecureTextEntry = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(signInButtonClick(_:)))
        let tapPasswordToggle = UITapGestureRecognizer(target: self, action: #selector(passwordToggle(_:)))
        let tapConfirmPasswordToggle = UITapGestureRecognizer(target: self, action: #selector(confirmPasswordToggle(_:)))
        signInButton.addGestureRecognizer(tap)
        icPasswordToggle.addGestureRecognizer(tapPasswordToggle)
        icConfirmPasswordToggle.addGestureRecognizer(tapConfirmPasswordToggle)
    }
    
    @objc func passwordToggle(_ sender:Any) {
        if(passwordTextField.isSecureTextEntry){
            passwordTextField.isSecureTextEntry = false
            icPasswordToggle.image = UIImage(systemName: "eye")
        }
        else{
            passwordTextField.isSecureTextEntry = true
            icPasswordToggle.image = UIImage(systemName: "eye.slash")
        }
    }
    
    @objc func confirmPasswordToggle(_ sender:Any) {
        if(confirmTextField.isSecureTextEntry){
            confirmTextField.isSecureTextEntry = false
            icConfirmPasswordToggle.image = UIImage(systemName: "eye")
        }
        else{
            confirmTextField.isSecureTextEntry = true
            icConfirmPasswordToggle.image = UIImage(systemName: "eye.slash")
        }
    }
    
    @objc func signInButtonClick(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmTextField.text ?? ""
        
        if(name.isEmpty){
            showAlertMessage(message: "Please enter your name.")
            return
        }
        else if(email.isEmpty){
            showAlertMessage(message: "Please enter valid email address.")
            return
        }
        else if(password.isEmpty){
            showAlertMessage(message: "Please enter your password.")
            return
        }
        else if(password.count<4){
            showAlertMessage(message: "Password should be at latest 4 digits.")
            return
        }
        else if(password != confirmPassword){
            showAlertMessage(message: "Password and confirm password should be same.")
            return
        }
        else{
            
        }
        
    }
    
    func showAlertMessage(message : String){
        let uialert = UIAlertController(title: "Invalid", message: message,
                                        preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
    }
    
}

