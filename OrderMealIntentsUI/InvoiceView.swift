//
//  InvoiceView.swift
//  OrderMealIntentsUI
//
//  Created by Zsolt Pete on 2018. 12. 25..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class InvoiceView: UIView, TableViewNibRegistration {
    
    var items = [Meal]()
    
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.dataSource = self
        self.tableView.rowHeight = 50
        self.registerTableViewNibs(nibName: Cells.OrderMealIntentUICell)
    }
}

extension InvoiceView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.OrderMealIntentUICell, for: indexPath) as? OrderMealIntentUICell else {
            return UITableViewCell()
        }
        
        let meal = items[indexPath.row]
        
        cell.titleLabel.text = meal.name
        cell.mealImageView.image = UIImage(named: meal.mealType?.rawValue.lowercased() ?? "")
        
        return cell
        
    }
    
    
    
    
}
