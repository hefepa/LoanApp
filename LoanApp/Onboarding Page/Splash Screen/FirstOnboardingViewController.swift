//
//  FirstOnboardingViewController.swift
//  LoanApp
//
//  Created by WEMA on 25/01/2024.
//

import UIKit

class FirstOnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0
    var data: [SplashProperties] = SplashModel().setupData()
    //var allCell: [UICollectionViewCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
  
        collectionView.register(UINib(nibName: "OnboardingOneCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingOneCollectionViewCell")
        collectionView.register(UINib(nibName: "OnboardingTwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingTwoCollectionViewCell")
        collectionView.register(UINib(nibName: "OnboardingThreeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingThreeCollectionViewCell")
        
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
       view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor

     
    }
}

extension FirstOnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingOneCollectionViewCell", for: indexPath) as! OnboardingOneCollectionViewCell
        var cellCollection = data[indexPath.item]
        cell.navigationController = navigationController
        cell.updateCell(with: cellCollection, index: indexPath.item, navigationController: cell.navigationController)
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
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
    
