//
//  MealType.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

class MealType {
    
    var name: String?
    var imageUrl: String?
    
    init(name: String?, imageUrl: String?) {
        self.name = name
        self.imageUrl = imageUrl
    }
    
}

extension MealType: MealTypeCellBindable {
    
    var pImage: UIImage {
        return UIImage(named: imageUrl ?? "") ?? UIImage()
    }
    
    
    var pTitle: String {
        return self.name ?? "UnNamed"
    }
    
    
}
