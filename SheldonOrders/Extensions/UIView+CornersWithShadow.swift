//
//  UIView+CornersWithShadow.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 05..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

protocol ViewCornerWithShadowable {
    var shadowLayer: CAShapeLayer? { get set }
}

extension ViewCornerWithShadowable where Self: UIView {
    
    func addDefaultCornerWithShadow(cornerRadius: CGFloat, fillColor: UIColor, shadowsProtocol: ShadowsProtocol.Type){
        let shadowLayer = CAShapeLayer()
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        
        shadowLayer.shadowColor = shadowsProtocol.Color.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = shadowsProtocol.Offset
        shadowLayer.shadowOpacity = shadowsProtocol.Opacity
        shadowLayer.shadowRadius = shadowsProtocol.Radius
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
}
