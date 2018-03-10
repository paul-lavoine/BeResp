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
    var delegate: ShopDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = shop?.title
        
        tableView.estimatedRowHeight = 160.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(MealCellConstant.nib, forCellReuseIdentifier: MealCellConstant.reuseIdentifier)
        
        mealHeader.configure(with: (shop?.title)!)
        self.tableView.tableHeaderView = mealHeader
    }
    
    func configure(with shop: Shop, delegate: ShopDetailDelegate) {
        self.shop = shop
        self.delegate = delegate
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealCellConstant.reuseIdentifier, for: indexPath) as? MealCell else {
            fatalError("Error Meal Cell")
        }
        
        guard let meal = meals[indexPath.row]  as? Meal else {
            return cell
        }
        
        cell.configure(with: meal)
        return cell
    }
}

extension MealViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.didSelect(meal: meals[indexPath.row])
    }
}
