//
//  FirstOnboardingViewController.swift
//  LoanApp
//
//  Created by WEMA on 25/01/2024.
//

import UIKit

class FirstOnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    //var allCell: [UICollectionViewCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "OnboardingOneCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingOneCollectionViewCell")
        collectionView.register(UINib(nibName: "OnboardingTwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingTwoCollectionViewCell")
        collectionView.register(UINib(nibName: "OnboardingThreeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingThreeCollectionViewCell")
     
    }
}

extension FirstOnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingOneCollectionViewCell", for: indexPath)
        return cell
    }
}

extension FirstOnboardingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let heightOfTheScreen = collectionView.bounds.height
        return CGSize(width: width, height: heightOfTheScreen)
    }
}
    
