////
////  OnboardingOneViewController.swift
////  LoanApp
////
////  Created by WEMA on 25/01/2024.
////
//
//import UIKit
//
//class OnboardingOneViewController: UIPageViewController {
//    var onboardingControllers: [UIViewController] = []
//    var pageControl = UIPageControl()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let firstViewController = FirstViewController(nibName: "FirstViewController", bundle: nil)
//        let secondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
//        let thirdViewController = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
//        onboardingControllers = [firstViewController, secondViewController, thirdViewController]
//        
//        dataSource = self
//        delegate = self
////        scrollView.delegate = self
//        // Set the initial view controller
//        if let onboardingControllers = onboardingControllers.first {
//            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
//        }
//        configurePageControl()
//        //setCurrentPage(index: 1)
//    }
//    
//    func configurePageControl() {
//        // Set up UIPageControl
//        pageControl.backgroundColor = .red
//        pageControl.numberOfPages = onboardingControllers.count
//        pageControl.currentPage = 0
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(pageControl)
//        
//        // Add constraints for UIPageControl
//        NSLayoutConstraint.activate([
//            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
//        ])
//    }
//    
//    func setCurrentPage(index: Int) {
//        guard index >= 0 && index < onboardingControllers.count else {
//            return
//        }
//        
//        if let currentViewController = onboardingControllers.first,
//           let currentIndex = onboardingControllers.firstIndex(of: currentViewController) {
//            pageControl.currentPage = currentIndex
//        }
//        
//        let direction: UIPageViewController.NavigationDirection = index > pageControl.currentPage ? .forward : .reverse
//        let nextViewController = onboardingControllers[index]
//        
//        setViewControllers([nextViewController], direction: direction, animated: true, completion: nil)
//        pageControl.currentPage = index
//    }
//}
//
//
//extension OnboardingOneViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let index = onboardingControllers.firstIndex(of: viewController), index > 0 else {
//            return nil
//        }
//        return onboardingControllers[index - 1]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let index = onboardingControllers.firstIndex(of: viewController), index < onboardingControllers.count - 1 else {
//            return nil
//        }
//        return onboardingControllers[index + 1]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if let currentViewController = onboardingControllers.first,
//           let index = onboardingControllers.firstIndex(of: currentViewController) {
//            pageControl.currentPage = index
//        }
//    }
//}
