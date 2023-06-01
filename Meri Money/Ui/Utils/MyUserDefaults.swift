//
//  UserDefaults.swift
//  Meri Money
//
//  Created by Prince Saini on 29/05/23.
//

import UIKit

class MyUserDefaults: NSObject {

    var USER_TOKEN = "user_token"
    
    func saveAccessToken(accessToken : String){
        let preferences = UserDefaults.standard
        preferences.setValue(USER_TOKEN, forKey: accessToken)
        let didSave = preferences.synchronize()
        if !didSave {
            print("Access Token didn't save")
        }
        else {
            print("Access Token saved successfully.")
        }
    }
    
    func getAccessToken() -> String? {
        let preferences = UserDefaults.standard
        if preferences.object(forKey: USER_TOKEN) == nil {
           return nil
        } else {
            let currentLevel = preferences.string(forKey: USER_TOKEN)
            return currentLevel
        }
    }
    
    
}
