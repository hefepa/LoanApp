//
//  Model.swift
//  LoanApp
//
//  Created by WEMA on 26/01/2024.
//

import Foundation

struct RegistrationModel: Codable{
    let firstName: String
    let lastName: String
    let email: String
    let password: String

    }

class RegistrationResponseModel: Codable{
    let message: String?
    let success: Bool?
}

class VerificationModel{
    let otp: String
    
    init(otp: String) {
        self.otp = otp
    }
    
    var apiRequestBody: [String: String] {
        return ["otp": otp]
    }
    
}

class VerificationResponseModel: Codable{
    let message : String?
    let success: Bool?
}
    
class LoginResponseModel: Codable{
    let token: String?
    let userDetails: LoginUserDetailsModel?
    
}

class LoginUserDetailsModel: Codable{
    let firstName: String?
    let lastName: String?
    let email: String?
}
    
