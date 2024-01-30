//
//  OnboardingOneCollectionViewCell.swift
//  LoanApp
//
//  Created by WEMA on 25/01/2024.
//

import UIKit

class OnboardingOneCollectionViewCell: UICollectionViewCell {

    weak var navigationController: UINavigationController!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var depositLabel: UILabel!
    @IBOutlet weak var ezzLabel: UILabel!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        getStartedBtn.isHidden = true
    }
    
    @IBAction func getStartedButton(_ sender: Any) {
        let registration = RegistrationHomeViewController()
        navigationController?.pushViewController(registration, animated: true)
    }
    func updateCell(with data: SplashProperties, index: Int, navigationController: UINavigationController){
        self.navigationController = navigationController
        ezzLabel.text = data.firstLable
        depositLabel.text = data.secondLabel
        img.image = UIImage(named: data.img)
        
        if index == 2 {
            getStartedBtn.isHidden = false
            depositLabel.isHidden = false
            viewContainer.isHidden = true
            
            var getStarted = UILabel()
            
            getStarted.text = "Click the button below to Get Started"
            getStarted.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(getStarted)
            getStarted.topAnchor.constraint(equalTo: ezzLabel.bottomAnchor, constant: 20).isActive = true
            getStarted.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
            getStarted.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
            getStarted.textAlignment = .center
            getStarted.textColor = .systemPurple
            img.topAnchor.constraint(equalTo: getStarted.bottomAnchor, constant: -50).isActive = true
        }
    }
}
