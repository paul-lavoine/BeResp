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
    
    
    static func shopDetailViewController(shop: Shop) -> UIViewController {
        guard let shopDetailViewController = StoryboardManager.main().instantiateViewController(withIdentifier: "ShopDetailViewController") as? ShopDetailViewController else {
            fatalError("Cannot instantiate view controller ShopDetailViewController from storyboard")
        }
        shopDetailViewController.configure(with: shop)
        return shopsViewController
    }
}

