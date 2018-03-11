//
//  MenuViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

enum MenuType: String {
    case profil        = "Profil"
    case favorites     = "Mes favoris"
    case notifications = "Notification"
    case settings      = "Réglages"
    case loggout       = "Se déconnecter"
    
    func image() -> UIImage {
        var imageName = ""
        switch self {
        case .profil:
            imageName = "picto_profil"
        case .favorites:
            imageName = "picto_favorites"
        case .notifications:
            imageName = "picto_notification"
        case .settings:
            imageName = "picto_settings"
        case .loggout:
            imageName = "picto_loggout"
        }
        
        return UIImage(named: imageName)!
    }
}

class MenuViewController: UIViewController {

    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tableHeaderView: MenuHeaderView!
    
    // Data
    let tabsMenu: [MenuType] = [.profil, .favorites, .notifications, .settings, .loggout]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userImage = UIImage(named: "profile_banner")
        tableHeaderView.configure(with: userImage!)
        tableView.tableHeaderView = tableHeaderView
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type: MenuType = tabsMenu[indexPath.row]
        var viewController: UIViewController?
        
        switch type {
        case .profil:
            viewController = StoryboardManager.profileViewController()
            break
        case .favorites:
            viewController = StoryboardManager.favoritesViewController()
            break
        case .notifications:
            break
        case .settings:
            break
        case .loggout:
            self.navigationController?.popToRootViewController(animated: true)
        break
        }
        
        guard let selectedViewController = viewController else {
            return
        }
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        
        
        for vc in navigationController.viewControllers {
            if vc.isKind(of: selectedViewController.classForCoder)  {
                if vc != navigationController.viewControllers.first {
                    navigationController.popToViewController(selectedViewController, animated: true)
                }
                mainViewController.hideLeftView(animated: true, completionHandler: nil)
                return
            }
        }
        
        navigationController.pushViewController(selectedViewController, animated: true)
        mainViewController.hideLeftView(animated: true, completionHandler: nil)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabsMenu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCellConstant.reuseIdentifier, for: indexPath) as? MenuCell else {
            fatalError("Unexpected cell (\(MenuCellConstant.reuseIdentifier)) dequeued from tableView")
        }
        
        let tab: MenuType = tabsMenu[indexPath.row]
        cell.configure(with: tab)
        
        return cell
    }
}
