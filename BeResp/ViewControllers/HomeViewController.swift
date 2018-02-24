//
//  HomeViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var homePagerViewController: HomePagerViewController? {
        didSet {
            homePagerViewController?.homeDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = (homePagerViewController?.orderedViewControllers.count)!
        pageControl.addTarget(self, action: #selector(didChangePageControlValue), for: .valueChanged)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let homePagerViewController = segue.destination as? HomePagerViewController {
            self.homePagerViewController = homePagerViewController
        }
    }
    
    @objc func didChangePageControlValue() {
        homePagerViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HomeViewController: HomePagerViewControllerDelegate {
    
    func homePageViewController(tutorialPageViewController: HomePagerViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func homePageViewController(tutorialPageViewController: HomePagerViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
}
