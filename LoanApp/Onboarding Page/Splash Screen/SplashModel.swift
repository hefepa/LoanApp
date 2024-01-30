//
//  SplashModel.swift
//  LoanApp
//
//  Created by WEMA on 25/01/2024.
//

import Foundation

struct SplashProperties{
    let firstLable: String
    let secondLabel: String
    let img: String
    let getStartedBtn: String
}

struct SplashModel{
    func setupData() -> [SplashProperties] {
        [
            SplashProperties(firstLable: "EZLOAN", secondLabel: "Fixed Deposit", img: "loan", getStartedBtn: ""),
            SplashProperties(firstLable: "EZLOAN", secondLabel: "Mortgage Calculator", img: "onboarding002 1", getStartedBtn: ""),
            SplashProperties(firstLable: "EZLOAN", secondLabel: "Fixed Deposit", img: "loanonboarding003 1", getStartedBtn: "")
        ]
        
    }
}
