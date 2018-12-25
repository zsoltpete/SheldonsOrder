//
//  InvoiceView.swift
//  OrderMealIntentsUI
//
//  Created by Zsolt Pete on 2018. 12. 25..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class InvoiceView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = Fonts.InvoiceIntentView.Title
        self.priceLabel.font = Fonts.InvoiceIntentView.Title
        
        self.titleLabel.textColor = Colors.InvoiceIntentView.Title
        self.priceLabel.textColor = Colors.InvoiceIntentView.Price
    }
}
