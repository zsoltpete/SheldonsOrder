//
//  HistoryCell.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 24..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

protocol HistoryCellBindable {
    
    var pTitle: String { get }
    var pPrice: String { get }
    var pimage: UIImage { get }
    
}

class HistoryCell: UITableViewCell {

    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    //You do not change these methods

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
        self.priceLabel.textColor = Colors.TypeSelectionCell.Price
    }
    
    func addFonts(){
        self.titleLabel?.font = Fonts.TypeSelectionCell.Title
        self.priceLabel?.font = Fonts.TypeSelectionCell.Price
    }
    
    func bind(_ model: HistoryCellBindable) {
        
        self.mealImageView.image = model.pimage
        self.titleLabel.text = model.pTitle
        self.priceLabel.text = model.pPrice
        
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.containerView.layer.cornerRadius = 8.0
    }

}
