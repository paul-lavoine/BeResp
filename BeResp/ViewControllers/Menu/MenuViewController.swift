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
}

class MenuViewController: UIViewController {

    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // Data
    let tabsMenu: [MenuType] = [.profil, .favorites, .notifications, .settings, .loggout]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        
        guard let vc = viewController else {
            return
        }
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        navigationController.pushViewController(vc, animated: true)
        
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
