//
//  RegistrationMVVMModel.swift
//  LoanApp
//
//  Created by WEMA on 26/01/2024.
//

import Foundation
protocol RegistrationModelDelegate: AnyObject {
    
    func DidReceivedResponse(data: RegistrationResponseModel?)
    func DidReceiveError(error: String)
}

protocol VerificationModelDelegate: AnyObject {
    
    func DidReceivedResponse(data: VerificationResponseModel?)
    func DidReceiveError(error: String)
}

class RegistrationViewModel {

    weak var delegate: RegistrationModelDelegate?
    
    func registerUser(usernameInput: String, emailInput: String, passwordInput: String) async {
        //let networkCall = NetworkCall()
       
        do {
            let dico: [String: Any] = ["firstName": usernameInput, "lastName": usernameInput, "email": emailInput, "password": passwordInput]
        
            let postURLString = "https://ab78-102-88-70-102.ngrok-free.app/api/User/register"
                    guard let postURL = URL(string: postURLString) else {
                        return
                    }
            let registerModel = try await NetworkCall.shared.register(url: postURL, httpMethod: "POST", httpBodyPayload: dico)
            
            print("output is \(registerModel)")
            delegate?.DidReceivedResponse(data: registerModel)
            
        }catch(let error){
            print("not found")
            delegate?.DidReceiveError(error: "\(error.localizedDescription)")
        }
        
    }
}

class VerificationViewModel {

    weak var delegate: VerificationModelDelegate?
    
    func verifyOTP(otps: String) async {
        //let networkCall = NetworkCall()
       
        do {
            let dico: [String: Any] = ["otp": otps]
            let postURLString = "https://ab78-102-88-70-102.ngrok-free.app/api/User/validate"
                    guard let postURL = URL(string: postURLString) else {
                        return
                    }
            let verifyModel = try await NetworkCall.shared.verify(url: postURL, httpMethod: "POST", httpBodyPayload: dico)
            
            print("output is \(verifyModel)")
            delegate?.DidReceivedResponse(data: verifyModel)
            
        }catch(let error){
            print("not found")
            delegate?.DidReceiveError(error: "\(error.localizedDescription)")
        }
        
    }
}
