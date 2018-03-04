//
//  MealViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 04/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mealHeader: MealHeader!
    
    // Data
    var meals: [Meal] = MealsController.shared.meals
    var shop: Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = shop?.title
        
        mealHeader.configure(with: (shop?.title)!)
        self.tableView.tableHeaderView = mealHeader
    }
    
    func configure(with shop: Shop) {
        self.shop = shop
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as? MealCell else {
            fatalError("Error Meal Cell")
        }
        
        return cell
    }
    
    
}

extension MealViewController: UITableViewDelegate {
    
}
