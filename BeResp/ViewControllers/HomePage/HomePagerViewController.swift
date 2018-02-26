//
//  HomePagerViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class HomePagerViewController: UIPageViewController {
    
    weak var homeDelegate: HomePagerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.homePresentationViewController(),
                self.homeDescriptionViewController(position: 1),
                self.homeDescriptionViewController(position: 2),
                self.homeDescriptionViewController(position: 3)]
    }()
    
    private func homePresentationViewController() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePresentationViewController")
    }
    
    private func homeDescriptionViewController(position: Int) -> UIViewController {
        let controller: HomeDescriptionViewController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeDescriptionViewController") as! HomeDescriptionViewController
        controller.currentPosition = position
        return controller
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.index(of: firstViewController) {
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = orderedViewControllers[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController, direction: UIPageViewControllerNavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    /**
     Notifies '_tutorialDelegate' that the current page index was updated.
     */
    private func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            homeDelegate?.homePageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
}

extension HomePagerViewController: UIPageViewControllerDataSource {
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}


extension HomePagerViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifyTutorialDelegateOfNewIndex()
    }
    
}

protocol HomePagerViewControllerDelegate: class {
    /**
     Called when the number of pages is updated.
     
     - parameter homePageViewController: the HomePageViewController instance
     - parameter count: the total number of pages.
     */
    func homePageViewController(tutorialPageViewController: HomePagerViewController, didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter homePageViewController: the HomePageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func homePageViewController(tutorialPageViewController: HomePagerViewController, didUpdatePageIndex index: Int)
}

