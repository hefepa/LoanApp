//
//  HomeViewController.swift
//  LoanApp
//
//  Created by WEMA on 29/01/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userStatus: UILabel!
    @IBOutlet weak var notificationBellImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var hashLabel: UILabel!
    @IBOutlet weak var triContentView: UIView!
    @IBOutlet weak var transferContainer: UIView!
    @IBOutlet weak var transferImage: UIImageView!
    @IBOutlet weak var requestContainer: UIView!
    @IBOutlet weak var requestImage: UIImageView!
    @IBOutlet weak var inOutContainer: UIView!
    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var inOutImage: UIImageView!
    @IBOutlet weak var secondContainer: UIView!    
    @IBOutlet weak var createAppButton: UIButton!
    
    
    let myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let myContentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //UISetup()

    }

//    func UISetup(){
//        view.addSubview(myScrollView)
//        myScrollView.translatesAutoresizingMaskIntoConstraints = false
//        myScrollView.addSubview(myContentView)
//        myContentView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate(
//            [
//                myScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                
//                myContentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
//                myContentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
//                myContentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
//                myContentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
//                myContentView.heightAnchor.constraint(equalTo: myScrollView.heightAnchor, multiplier: 1),
//                
//                userImage.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
//
//            ])
    }
