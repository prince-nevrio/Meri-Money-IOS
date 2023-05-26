//
//  ViewController.swift
//  Meri Money
//
//  Created by Prince Saini on 25/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var icPasswordToggle: UIImageView!
    @IBOutlet weak var signUpButton: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.isUserInteractionEnabled = true
        icPasswordToggle.isUserInteractionEnabled = true
        passwordTextField.isSecureTextEntry = true
        let tapPasswordToggle = UITapGestureRecognizer(target: self, action: #selector(passwordToggle(_:)))
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(signUpButtonClick(_:)))
        signUpButton.addGestureRecognizer(tapSignUp)
        icPasswordToggle.addGestureRecognizer(tapPasswordToggle)
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
    
      @objc func signUpButtonClick(_ sender:Any) {
        openSignUpScreen()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        print("Login Button Clicked.")
        if let email = emailTextField.text, email.isEmpty {
            showAlertMessage(message: "Username/Phonenumber field is required.")
            return
        }
        else if let password = passwordTextField.text, password.isEmpty {
            showAlertMessage(message: "Password field is required.")
            return
        }
        else{
            //            let email = emailTextField.text ?? ""
            //            let password = passwordTextField.text ?? ""
            
            
        }
        
        
        
    }
    
    func openSignUpScreen(){
        let yourStoryboardName = UIStoryboard(name: "Main", bundle: nil)
        let vc = yourStoryboardName.instantiateViewController(withIdentifier: "SignUpScreen") as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    
    func showAlertMessage(message : String){
        let uialert = UIAlertController(title: "Invalid", message: message,
                                        preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
    }
    
}

