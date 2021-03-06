//
//  MealTypeCell.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

protocol MealTypeCellBindable {
    
    var pTitle: String { get }
    var pImage: UIImage { get }
    
}

class MealTypeCell: UICollectionViewCell, ViewCornerWithShadowable {
    
    var shadowLayer: CAShapeLayer?

    @IBOutlet weak var containerView: ConatinerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var item: MealTypeCellBindable?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.addDefaultCornerWithShadow(cornerRadius: 8.0, fillColor: Colors.MealTypeCell.Background, shadowsProtocol: Shadows.MealTypeCell.self)
        self.containerView.layer.sublayers?[0].position = CGPoint(x: 8.0, y: 8.0)
        self.initialize()
    }

    //Now you can change

    func initialize() {
        self.styleUI()
    }
    
    func styleUI(){
        self.addColors()
        self.addFonts()
    }
    
    func addColors(){
        self.titleLabel.textColor = UIColor.black
    }
    
    func addFonts(){
        self.titleLabel?.font = Fonts.MealType.MealTypeItem
        self.titleLabel.textAlignment = .center
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func bind(model: MealTypeCellBindable) {
        self.item = model
        self.titleLabel.text = model.pTitle
        self.imageView.image = model.pImage
    }

}
