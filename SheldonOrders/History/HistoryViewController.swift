//
//  HistoryViewController.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 24..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, TableViewNibRegistration {

    var items = [Meal]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = OrderManager.shared.getAllOrderedMeals().reversed()
        self.tableView.dataSource = self
        self.tableView.rowHeight = 88.0
        self.registerTableViewNibs(nibName: Cells.HistoryCell)
    }

}


extension HistoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.HistoryCell, for: indexPath) as? HistoryCell else {
            return UITableViewCell()
        }
        
        cell.bind(self.items[indexPath.row])
        
        return cell
    }
    
    
    
}
