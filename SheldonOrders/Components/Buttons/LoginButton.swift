//
//  LoginButton.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 05..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class LoginButton: UIButton, ViewCornerWithShadowable {
    var shadowLayer: CAShapeLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.styleUI()
    }
    
    func styleUI(){
        self.addColors()
        self.addFonts()
    }
    
    func addColors(){
        self.setTitleColor(Colors.Login.LoginButtonTitle, for: .normal)
    }
    
    func addFonts(){
        self.titleLabel?.font = Fonts.Login.LoginButton
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addDefaultCornerWithShadow(cornerRadius: self.bounds.height / 2.0, fillColor: Colors.Login.LoginButtonBackground, shadowsProtocol: Shadows.LoginButton.self)
    }
    
}
