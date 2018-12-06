//
//  Shadows.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 05..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

struct Shadows {
    
    struct LoginButton: ShadowsProtocol {
        
        static let Opacity: Float = 1.0
        static let Color = Colors.Login.LogiButtonShadow
        static let Offset = CGSize(width: 0, height: 2)
        static let Radius: CGFloat = 4.0
        
    }
    
    struct MealTypeCell: ShadowsProtocol {
        
        static let Opacity: Float = 1.0
        static let Color = Colors.Login.LogiButtonShadow
        static let Offset = CGSize(width: 0, height: 2)
        static let Radius: CGFloat = 4.0
        
    }
    
}

protocol ShadowsProtocol {
    
    static var Opacity: Float { get }
    static var Color: UIColor { get }
    static var Offset: CGSize { get }
    static var Radius: CGFloat { get }
    
}
