//
//  BaseViewController.swift
//  Meri Money
//
//  Created by Prince Saini on 27/05/23.
//

import UIKit

class BaseViewController: UIViewController {
    var loadingIndicator : UIActivityIndicatorView?
    var userDefault : MyUserDefaults?
    
    override func viewDidLoad() {
        userDefault = MyUserDefaults()
        initLoadingView()
    }
    
    private func initLoadingView(){
        loadingIndicator = UIActivityIndicatorView(style: .large)
        view.addSubview(loadingIndicator!)
        loadingIndicator?.center = CGPoint(x: view.frame.size.width*0.5, y: view.frame.size.height*0.5)
    }
    
    func isUserLoggedIn() -> Bool{
        let user = getAccessToken()
        if(user == nil){
            return false
        }
        else{
            return true
        }
        
    }
    
    // Call this method to show the loading indicator
    func showLoadingIndicator() {
        loadingIndicator?.startAnimating()
    }
    
    // Call this method to hide the loading indicator
    func hideLoadingIndicator() {
        self.loadingIndicator?.stopAnimating()
    }
    
    /* Display alert message */
    func showAlertMessage(message : String){
        let uialert = UIAlertController(title: "Invalid", message: message,
                                        preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
    }
    
    func saveUserToken(accessToken :  String){
        userDefault?.saveAccessToken(accessToken: accessToken)
    }
    
    func getAccessToken() -> String? {
        return userDefault?.getAccessToken()
    }
    
}
