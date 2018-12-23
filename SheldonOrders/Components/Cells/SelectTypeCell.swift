//
//  SelectTypeCell.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

protocol SelectTypeCellBindable {
    
    var pTitle: String { get }
    var pPrice: String { get }
    var pDescription: String { get }
    
}

class SelectTypeCell: UITableViewCell {
    
    @IBOutlet weak var containerView: ConatinerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var isExpanded = false
    var isOrder = false
    var orderCompletition: ((Bool) -> ())?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }

    //Now you can change

    func initialize() {
        self.styleUI()
    }
    
    func styleUI(){
        self.addShadow()
        self.addColors()
        self.addFonts()
        self.orderButton.setTitle("Order", for: .normal)
    }
    
    func addShadow(){
        
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.containerView.layer.shadowRadius = 4.0
        self.containerView.layer.shadowOpacity = 0.5
    }
    
    func addColors(){
        self.containerView.backgroundColor = Colors.TypeSelectionCell.Background
        self.titleLabel.textColor = Colors.TypeSelectionCell.Title
        self.orderButton.setTitleColor(Colors.TypeSelectionCell.OrderButton, for: .normal)
        self.seperatorView.backgroundColor = Colors.TypeSelectionCell.Seperator
        self.descriptionLabel.textColor = Colors.TypeSelectionCell.Description
        self.priceLabel.textColor = Colors.TypeSelectionCell.Price
    }
    
    func addFonts(){
        self.titleLabel?.font = Fonts.TypeSelectionCell.Title
        self.orderButton.titleLabel?.font = Fonts.TypeSelectionCell.OrderButton
        self.descriptionLabel?.font = Fonts.TypeSelectionCell.Description
        self.priceLabel?.font = Fonts.TypeSelectionCell.Price
    }
    
    func bind(_ model: SelectTypeCellBindable) {
        self.titleLabel.text = model.pTitle
        self.descriptionLabel.text = model.pDescription
        self.priceLabel.text = model.pPrice
    }
    
    func expand(){
        self.isExpanded = !self.isExpanded
        if self.isExpanded {
            self.descriptionLabel.alpha = 1.0
            self.priceLabel.alpha = 1.0
            self.seperatorView.alpha = 1.0
        } else {
            self.descriptionLabel.alpha = 0.0
            self.priceLabel.alpha = 0.0
            self.seperatorView.alpha = 0.0
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.containerView.layer.cornerRadius = 8.0
    }
    
    @IBAction func order(_ sender: Any) {
        self.isOrder = !self.isOrder
        self.orderCompletition?(self.isOrder)
        if isOrder {
            self.orderButton.setTitle("Ordered", for: .normal)
            self.orderButton.setTitleColor(Colors.TypeSelectionCell.OrderedButton, for: .normal)
        } else {
            self.orderButton.setTitle("Order", for: .normal)
            self.orderButton.setTitleColor(Colors.TypeSelectionCell.OrderButton, for: .normal)
        }
    }
    
}
