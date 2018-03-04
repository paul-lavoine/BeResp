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
    
    // Data
    var meals: [Meal] = MealsController.shared.meals
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
