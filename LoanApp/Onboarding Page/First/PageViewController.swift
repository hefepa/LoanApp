////
////  PageViewController.swift
////  LoanApp
////
////  Created by WEMA on 25/01/2024.
////
//
//import UIKit
//
//class PageViewController: UIViewController {
//    
//    var pageViewController: UIPageViewController!
//    var viewControllers: [UIViewController] = [
//            FirstViewController(),
//            SecondViewController(),
//            ThirdViewController()
//        ]
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        pageViewController.dataSource = self
//        pageViewController.delegate = self
//        
//        
//        if let firstViewController = viewControllers.first {
//            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
//        }
//        // Add the pageViewController to the main view
//        addChild(pageViewController)
//        view.addSubview(pageViewController.view)
//        pageViewController.didMove(toParent: self)
//    }
//}
//
//extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else {
//            return nil
//        }
//        return viewControllers[index - 1]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else {
//            return nil
//        }
//        return viewControllers[index + 1]
//    }
//}
