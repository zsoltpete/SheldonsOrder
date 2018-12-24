//
//  MealType.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

enum MealTypeEnum: String, Codable {
    case Kebab
    case Soup
    case Burger
    case Pizza
    case Steak
    case Protein
    case Salad
    case Thai
}

class MealType {
    
    var type: MealTypeEnum?
    var imageUrl: String?
    
    init(type: MealTypeEnum?, imageUrl: String?) {
        self.type = type
        self.imageUrl = imageUrl
    }
    
}

extension MealType: MealTypeCellBindable {
    
    var pImage: UIImage {
        return UIImage(named: imageUrl ?? "") ?? UIImage()
    }
    
    
    var pTitle: String {
        return self.type?.rawValue ?? ""
    }
    
    
}
