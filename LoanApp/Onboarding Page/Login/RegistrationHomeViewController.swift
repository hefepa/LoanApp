//
//  RegistrationHomeViewController.swift
//  LoanApp
//
//  Created by WEMA on 25/01/2024.
//

import UIKit

class RegistrationHomeViewController: UIViewController, RegistrationModelDelegate {
    
    func DidReceivedResponse(data: RegistrationResponseModel?) {
        print("My response data is \(data?.message)")
//        let response = RegistrationResponseModel.self
//        print(response)
    }
    
    func DidReceiveError(error: String) {
        print("error")
    }
        
    var registerViewModel = RegistrationViewModel()
    
    
    @IBOutlet weak var alatLoanLabel: UILabel!
    @IBOutlet weak var createAccountLable: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var siginLabel: UILabel!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = UIImage(systemName: "person.fill")
        addleftimage (txtField: userNameTF, image: user!)
        let email = UIImage(systemName: "envelope.fill" )
        addleftimage (txtField: emailTF, image: email!)
        let password = UIImage(systemName: "lock.fill" )
        addleftimage (txtField: passwordTF, image: password!)
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.cornerRadius = 15
        
        checkBox.layer.borderWidth = 2.0
        checkBox.layer.borderColor = UIColor.red.cgColor
        
        
        let signIn = UITapGestureRecognizer(target: self, action: #selector(signIn))
        siginLabel.isUserInteractionEnabled = true
        siginLabel.addGestureRecognizer(signIn)
        
        registerViewModel.delegate = self
    }
    
    @objc func signIn(){
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    
    func addleftimage(txtField:UITextField, image img:UIImage){
        let leftimageview = UIImageView(frame:CGRect (x: 10, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        leftimageview.tintColor = .purple
        txtField.leftView = leftimageview
        txtField.leftViewMode = .always
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        Task {
            await registerViewModel.registerUser(usernameInput: userNameTF.text ?? "", emailInput: emailTF.text ?? "", passwordInput: passwordTF.text ?? "")
            let verificationController = VerificationViewController()
            navigationController?.pushViewController(verificationController, animated: true)
        }
    }
    
}

  

