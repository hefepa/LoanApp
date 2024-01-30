//
//  LoginViewController.swift
//  LoanApp
//
//  Created by WEMA on 26/01/2024.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var faceLock: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var signUpLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.shadowOpacity = 0.5
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewContainer.layer.shadowRadius = 4
        viewContainer.layer.cornerRadius = 15
        
        faceLock.image = UIImage(systemName: "faceid")
        
        let signUp = UITapGestureRecognizer(target: self, action: #selector(signUpFxn))
        signUpLable.isUserInteractionEnabled = true
        signUpLable.addGestureRecognizer(signUp)
    }
    
    @objc func signUpFxn(){
        let registrationViewController = RegistrationHomeViewController()
        navigationController?.popToViewController(registrationViewController, animated: true)
    }



}
