//
//  OrderMealIntentUICell.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 25..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class OrderMealIntentUICell: UITableViewCell {

    @IBOutlet weak private var containerView: UIView!

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }

    //Now you can change

    func initialize() {

    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

}
