//
//  Fonts.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 05..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

struct Fonts {
    
    private struct Names {
        
        static let Verdana = "Verdana"
        static let VerdanaBold = "Verdana-Bold"
        
    }
    
    struct Login {
        
        static let MainTitle = UIFont(name: Fonts.Names.VerdanaBold, size: 41.0)
        static let LoginnItem = UIFont(name: Fonts.Names.Verdana, size: 18.0)
        static let LoginButton = UIFont(name: Fonts.Names.VerdanaBold, size: 16.0)
        
    }
    
    struct MealType {
        static let MealTypeItem = UIFont(name: Fonts.Names.Verdana, size: 13.0)
    }
    
    struct TypeSelectionCell {
        static let Title = UIFont(name: Fonts.Names.Verdana, size: 13.0)
        static let OrderButton = UIFont(name: Fonts.Names.VerdanaBold, size: 17.0)
        static let Description = UIFont(name: Fonts.Names.Verdana, size: 11.0)
        static let Price = UIFont(name: Fonts.Names.VerdanaBold, size: 15.0)
    }
    
}
