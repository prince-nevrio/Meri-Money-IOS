//
//  ViewController.swift
//  Meri Money
//
//  Created by Prince Saini on 25/05/23.
//

import UIKit
import Alamofire
import Foundation

class ViewController: BaseViewController {
    
    @IBOutlet weak var icPasswordToggle: UIImageView!
    @IBOutlet weak var signUpButton: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isUserLoggedIn()){
            launchDashboardScreen()
        }
        launchDashboardScreen()
        signUpButton.isUserInteractionEnabled = true
        icPasswordToggle.isUserInteractionEnabled = true
        passwordTextField.isSecureTextEntry = true
        let tapPasswordToggle = UITapGestureRecognizer(target: self, action: #selector(passwordToggle(_:)))
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(signUpButtonClick(_:)))
        signUpButton.addGestureRecognizer(tapSignUp)
        icPasswordToggle.addGestureRecognizer(tapPasswordToggle)
    }
    
    /* if user already logged in then open dashbpard screen*/
    func launchDashboardScreen(){
        let yourStoryboardName = UIStoryboard(name: "Main", bundle: nil)
        let vc = yourStoryboardName.instantiateViewController(withIdentifier: "DashBoardScreen") as! DashBoardViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    
    /* Password toggle button click listener*/
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
    
    /* Sign up button click listener*/
    @objc func signUpButtonClick(_ sender:Any) {
        openSignUpScreen()
    }
    
    /* When login button click*/
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
            loginApiCall(_username : emailTextField.text ?? "" , _password: passwordTextField.text ?? "")
        }
    }
    
    /* Login api call */
    func loginApiCall(_username : String, _password : String){
       showLoadingIndicator()
        let header : HTTPHeaders = [
            .accept("application/json")]
        let parameters : [String : Any] = [
            "email" : _username,
            "password": _password
        ]
        AF.request(Constants.BASE_URL + Constants.LOGIN_API_ENDPOINTS,method : HTTPMethod.post,parameters: parameters,headers: header).validate(statusCode: 200..<300).responseDecodable { (response: AFDataResponse<SignUpDataModel>) in
            debugPrint("HTTP_RESPONSE ::: \(String(describing: response))" )
            switch(response.result){
            case .success(let data):
                debugPrint("Success Result ::: \(String(describing: data))" )
                self.saveUserToken(accessToken: data.accessToken)
                self.launchDashboardScreen()
            case .failure(_):
                debugPrint("Error ::: Something went wrong.)" )
            }
            self.hideLoadingIndicator()
            return
        }}
    
    /* Open sign up screen to create account*/
    func openSignUpScreen(){
        let yourStoryboardName = UIStoryboard(name: "Main", bundle: nil)
        let vc = yourStoryboardName.instantiateViewController(withIdentifier: "SignUpScreen") as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
}

