//
//  ConfirmView.swift
//  OrderMealIntentsUI
//
//  Created by Zsolt Pete on 2018. 12. 25..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class ConfirmView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel.font = Fonts.ConfirmIntentView.Title
        
        self.titleLabel.textColor = Colors.ConfirmIntentView.Title
    }

}
