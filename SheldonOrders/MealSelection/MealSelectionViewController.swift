//
//  MealSelectionViewController.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class MealSelectionViewController: UIViewController, TableViewNibRegistration {

    @IBOutlet weak var tableView: UITableView!
    
    var mealType: MealType?
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewNibs(nibName: Cells.SelectTypeCell)
        let typeSelectionMocker = TypeSelectionMocker()
        self.meals = typeSelectionMocker.getMeal(for: self.mealType)
        self.tableView.reloadData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 66
    }
    
    @IBAction func completeOrder(_ sender: Any) {
        OrderManager.shared.completeOrder()
        self.navigationController?.popViewController(animated: false)
    }
    
}

extension MealSelectionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.SelectTypeCell, for: indexPath) as? SelectTypeCell else {
            return UITableViewCell()
        }
        cell.bind(self.meals[indexPath.row])
        cell.orderCompletition = { [weak self]isOrder in
            if isOrder {
                OrderManager.shared.add(meal: self!.meals[indexPath.row])
            } else {
                OrderManager.shared.remove(meal: self!.meals[indexPath.row])
            }
        }
        return cell
    }
    
}

extension MealSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectTypeCell else {
            return
        }
        cell.expand()
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectTypeCell else {
            return 90.0
        }
        if cell.isExpanded {
            return 200.0
        } else {
            return 90.0
        }
    }
    
}
