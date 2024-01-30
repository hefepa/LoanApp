//
//  VerificationViewController.swift
//  LoanApp
//
//  Created by WEMA on 25/01/2024.
//

import UIKit

class VerificationViewController: UIViewController, VerificationModelDelegate {
    func DidReceivedResponse(data: VerificationResponseModel?) {
        print("Message is \(data?.message)")
    }
    
    func DidReceiveError(error: String) {
        print("Error")
    }
    

    
    var otpTextFields: [UITextField] = []
    var verificationViewModel = VerificationViewModel()


   
    
    let tokenStackView: UIStackView = {
       let tokenSV = UIStackView()
        tokenSV.translatesAutoresizingMaskIntoConstraints = false
        tokenSV.axis = .horizontal
        tokenSV.alignment = .center
        tokenSV.distribution = .fillEqually
        tokenSV.spacing = 15
        return tokenSV
    }()
   
        
    let verificationLabel: UILabel = {
        var verificationLb = UILabel()
        verificationLb.translatesAutoresizingMaskIntoConstraints = false
        verificationLb.text = "Verification Code"
        verificationLb.textAlignment = .center
        verificationLb.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        verificationLb.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return verificationLb
    }()
    
    let emailSentLabel: UILabel = {
        var emailSentLb = UILabel()
        emailSentLb.translatesAutoresizingMaskIntoConstraints = false
        emailSentLb.text = "We send the verification code to your email that you registered"
        emailSentLb.textAlignment = .center
        emailSentLb.numberOfLines = 0
        emailSentLb.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return emailSentLb
    }()
    
    let otpOneTextField: UITextField = {
        var otpTf = UITextField()
        otpTf.translatesAutoresizingMaskIntoConstraints = false
        otpTf.backgroundColor = .gray
        otpTf.layer.cornerRadius = 10
        otpTf.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor

        otpTf.keyboardType = .numberPad
        return otpTf
    }()
    
    let otpTwoTextField: UITextField = {
        var otpTwoTf = UITextField()
        otpTwoTf.translatesAutoresizingMaskIntoConstraints = false
        otpTwoTf.backgroundColor = .gray
        otpTwoTf.layer.cornerRadius = 8
        otpTwoTf.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        otpTwoTf
            .keyboardType = .numberPad
        return otpTwoTf
    }()
    
    let otpThreeTextField: UITextField = {
        var otpThreeTf = UITextField()
        otpThreeTf.translatesAutoresizingMaskIntoConstraints = false
        otpThreeTf.backgroundColor = .gray
        otpThreeTf.layer.cornerRadius = 8
        otpThreeTf.keyboardType = .numberPad
        otpThreeTf.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor

        return otpThreeTf
    }()
    
    let otpFourTextField: UITextField = {
        var otpFourTf = UITextField()
        otpFourTf.translatesAutoresizingMaskIntoConstraints = false
        otpFourTf.backgroundColor = .gray
        otpFourTf.layer.cornerRadius = 8
        otpFourTf.keyboardType = .numberPad
        otpFourTf.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor

        return otpFourTf
    }()
    
    let otpFiveTextField: UITextField = {
        var otpFiveTf = UITextField()
        otpFiveTf.translatesAutoresizingMaskIntoConstraints = false
        otpFiveTf.backgroundColor = .gray
        otpFiveTf.layer.cornerRadius = 8
        otpFiveTf.keyboardType = .numberPad
        otpFiveTf.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        return otpFiveTf
    }()
    
    let otpSixTextField: UITextField = {
        var otpSixTf = UITextField()
        otpSixTf.translatesAutoresizingMaskIntoConstraints = false
        otpSixTf.backgroundColor = .gray
        otpSixTf.layer.cornerRadius = 8
        otpSixTf.keyboardType = .numberPad
        otpSixTf.layer.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        return otpSixTf
    }()
    
    let unreceivedCodeLabel: UILabel = {
        var unreceivedCodeLb = UILabel()
        unreceivedCodeLb.translatesAutoresizingMaskIntoConstraints = false
        unreceivedCodeLb.font = UIFont.systemFont(ofSize: 15, weight: .light)
        unreceivedCodeLb.text = "If you don't received any code, please click"
        return unreceivedCodeLb
    }()
    
    let submitButton: UIButton = {
        var submitBtn = UIButton()
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.layer.cornerRadius = 15
        submitBtn.configuration?.cornerStyle = .capsule
        submitBtn.backgroundColor = .purple
        
        return submitBtn
    }()
    let loginInstruction: UILabel = {
        var haveAccountLb = UILabel()
        haveAccountLb.translatesAutoresizingMaskIntoConstraints = false
        haveAccountLb.text = "If you don't received any code, please click"
        haveAccountLb.numberOfLines = 0
        haveAccountLb.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return haveAccountLb
    }()
    let questionImage: UIImageView = {
        var questionImg = UIImageView()
        questionImg.translatesAutoresizingMaskIntoConstraints = false
        questionImg.image = UIImage(systemName: "questionmark.circle.fill")
        questionImg.contentMode = .scaleAspectFit
        questionImg.layer.cornerRadius = questionImg.frame.width / 2
        questionImg.clipsToBounds = true
        return questionImg
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verificationViewModel.delegate = self
        
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
       UIDesign()
        
        otpTextFields.append(otpOneTextField)
        otpTextFields.append(otpTwoTextField)
        otpTextFields.append(otpThreeTextField)
        otpTextFields.append(otpFourTextField)
        otpTextFields.append(otpFiveTextField)
        otpTextFields.append(otpSixTextField)
        
        for textField in otpTextFields {
            textField.delegate = self
            textField.textAlignment = .center
            textField.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        // Set the first text field as the initial responder
        otpTextFields.first?.becomeFirstResponder()
        
        submitButton.addTarget(self, action: #selector(submitButtonClicked(_ :)), for: .touchUpInside)
    }
    
    
    
    
    func UIDesign(){
        view.addSubview(verificationLabel)
        view.addSubview(emailSentLabel)
        view.addSubview(otpOneTextField)
        view.addSubview(otpTwoTextField)
        view.addSubview(otpThreeTextField)
        view.addSubview(otpFourTextField)
        view.addSubview(unreceivedCodeLabel)
        view.addSubview(submitButton)
        view.addSubview(loginInstruction)
        view.addSubview(questionImage)
        view.addSubview(tokenStackView)
        
        tokenStackView.addArrangedSubview(otpOneTextField)
        tokenStackView.addArrangedSubview(otpTwoTextField)
        tokenStackView.addArrangedSubview(otpThreeTextField)
        tokenStackView.addArrangedSubview(otpFourTextField)
        tokenStackView.addArrangedSubview(otpFiveTextField)
        tokenStackView.addArrangedSubview(otpSixTextField)


        NSLayoutConstraint.activate([
            verificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            verificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            verificationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            emailSentLabel.topAnchor.constraint(equalTo: verificationLabel.bottomAnchor, constant: 50),
            emailSentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailSentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            otpOneTextField.widthAnchor.constraint(equalToConstant: 60),
            otpOneTextField.heightAnchor.constraint(equalToConstant: 60),
            otpTwoTextField.widthAnchor.constraint(equalToConstant: 60),
            otpTwoTextField.heightAnchor.constraint(equalToConstant: 60),
            otpThreeTextField.widthAnchor.constraint(equalToConstant: 60),
            otpThreeTextField.heightAnchor.constraint(equalToConstant: 60),
            otpFourTextField.widthAnchor.constraint(equalToConstant: 60),
            otpFourTextField.heightAnchor.constraint(equalToConstant: 60),
            otpFiveTextField.widthAnchor.constraint(equalToConstant: 60),
            otpFiveTextField.heightAnchor.constraint(equalToConstant: 60),
            otpSixTextField.widthAnchor.constraint(equalToConstant: 60),
            otpSixTextField.heightAnchor.constraint(equalToConstant: 60),
            
            tokenStackView.topAnchor.constraint(equalTo: emailSentLabel.bottomAnchor, constant: 60),
            tokenStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tokenStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            unreceivedCodeLabel.topAnchor.constraint(equalTo: tokenStackView.bottomAnchor, constant: 60),
            unreceivedCodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            unreceivedCodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.topAnchor.constraint(equalTo: unreceivedCodeLabel.bottomAnchor, constant: 90),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            loginInstruction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //loginInstruction.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            loginInstruction.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            
            questionImage.leadingAnchor.constraint(equalTo: loginInstruction.trailingAnchor, constant: 5),
            //questionImage.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            questionImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            questionImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70)
        ])
    }
    
    
    @objc func submitButtonClicked(_ sender: UIButton){
        Task {
            let textFieldValues = otpTextFields.map { $0.text ?? "" }.joined()

            await verificationViewModel.verifyOTP(otps: textFieldValues)
            //let otp = otpTextFields.description
            //print("The user input is \(otp)")
            let loginPage = LoginViewController()
            navigationController?.pushViewController(loginPage, animated: true)
        }
    }
}


extension VerificationViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length

        if newLength <= maxLength {
            textField.text = string

            // Move focus to the next text field
            if let currentIndex = otpTextFields.firstIndex(of: textField), currentIndex < otpTextFields.count - 1 {
                otpTextFields[currentIndex + 1].becomeFirstResponder()
            }

            return false
        } else {
            return false
        }
    }
}
