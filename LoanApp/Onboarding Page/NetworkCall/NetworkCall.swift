//
//  NetworkCall.swift
//  LoanApp
//
//  Created by WEMA on 26/01/2024.
//

import Foundation

struct NetworkCall{
    let session = URLSession.shared
    static let shared = NetworkCall()
    func register(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> RegistrationResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            //urlRequest.setValue("Bearer tokenhere", forHTTPHeaderField: "Authorization")

            
            let (data, _) = try await session.data(for: urlRequest)  
//            let str = String(decoding: data, as: UTF8.self)
//            print("The result is \(str)")
            let jsonDecoder = JSONDecoder()
            let registerationModel = try jsonDecoder.decode(RegistrationResponseModel.self, from: data)
            print("The result is \(registerationModel)")
            return registerationModel
            
        }catch{
            throw error
        }
    }
    
    func verify(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> VerificationResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")

            let (data, _) = try await session.data(for: urlRequest)
//            let str = String(decoding: data, as: UTF8.self)
//            print("The result is \(str)")
            let jsonDecoder = JSONDecoder()
            let verificationModel = try jsonDecoder.decode(VerificationResponseModel.self, from: data)
            print("The result is \(verificationModel)")
            return verificationModel
            
        }catch{
            throw error
        }
    }
    
    func login(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> LoginResponseModel? {
        
        do{
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            if httpBodyPayload != nil {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: httpBodyPayload as Any, options: [])
            }
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await session.data(for: urlRequest)
            let jsonDecoder =  JSONDecoder()
            let loginModel = try jsonDecoder.decode(LoginResponseModel.self, from: data)
            print("The login model is \(loginModel)")
            return loginModel
        }catch {
            throw error
        }
    }
}
