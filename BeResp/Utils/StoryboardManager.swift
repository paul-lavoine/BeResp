//
//  StoryboardManager.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class StoryboardManager: NSObject {
    private static let shared = StoryboardManager()
    
    override private init () {
    }
    
    private static let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func main() -> UIStoryboard {
        return mainStoryboard
    }
    
    static func profileViewController() -> UIViewController {
        guard let profileViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else {
            fatalError("Cannot instantiate view controller ProfileViewController from storyboard")
        }
        
        return profileViewController
    }
    
    static func favoritesViewController() -> UIViewController {
        guard let favoritesViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController else {
            fatalError("Cannot instantiate view controller ProfileViewController from storyboard")
        }
        
        return favoritesViewController
    }
    
    
    static func shopsViewController() -> UIViewController {
        guard let shopsViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "ShopsViewController") as? ShopsViewController else {
            fatalError("Cannot instantiate view controller ShopsViewController from storyboard")
        }
        
        return shopsViewController
    }
    
    static func shopContainerViewController(shop: Shop) -> UIViewController {
        guard let shopContainerViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "ShopContainerViewController") as? ShopContainerViewController else {
            fatalError("Cannot instantiate view controller ShopContainerViewController from storyboard")
        }
        shopContainerViewController.configure(with: shop)
        return shopContainerViewController
    }
    
    static func shopDetailViewController(shop: Shop) -> UIViewController {
        guard let shopDetailViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "ShopDetailViewController") as? ShopDetailViewController else {
            fatalError("Cannot instantiate view controller ShopDetailViewController from storyboard")
        }
        shopDetailViewController.configure(with: shop)
        return shopDetailViewController
    }
    
    static func mealViewController(shop: Shop) -> UIViewController {
        guard let mealViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "MealViewController") as? MealViewController else {
            fatalError("Cannot instantiate view controller MealViewController from storyboard")
        }
        mealViewController.configure(with: shop)
        return mealViewController
    }
    
    static func mealDetailViewController(meal: Meal) -> UIViewController {
        guard let mealDetailViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "MealDetailViewController") as? MealDetailViewController else {
            fatalError("Cannot instantiate view controller MealDetailViewController from storyboard")
        }
        mealDetailViewController.configure(with: meal)
        return mealDetailViewController
    }
    
    static func navigationControllerShopDetail() -> UINavigationController {
        guard let navigationControllerShopDetail = StoryboardManager.main().instantiateViewController(withIdentifier: "NavigationControllerShopDetail") as? UINavigationController else {
            fatalError("Cannot instantiate view controller NavigationControllerShopDetail from storyboard")
        }
        
        return navigationControllerShopDetail
    }
}

