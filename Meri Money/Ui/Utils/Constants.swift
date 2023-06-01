//
//  Constants.swift
//  Meri Money
//
//  Created by Prince Saini on 26/05/23.
//

import UIKit

class Constants: NSObject {
    static let BASE_URL = "https://staging.merimoney.com/"
    
    /* API Endpoints */
    static let LOGIN_API_ENDPOINTS = "api/user/login"
    static let REGISTER_API_ENDPOINTS = "api/user/register"
    static let FORGOT_API_ENDPOINTS = "api/user/password/forgot"
    static let VERIFY_API_ENDPOINTS = "api/user/password/verify/{token}"
    static let RESET_API_ENDPOINTS = "api/user/password/reset"
}
