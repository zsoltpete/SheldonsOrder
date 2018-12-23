//
//  Meal.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class Meal {
    
    var name: String?
    var price: CGFloat?
    var description: String?
    
    init(name: String, price: CGFloat, description: String) {
        self.name = name
        self.price = price
        self.description = description
    }
    
}

extension Meal: SelectTypeCellBindable {
    
    var pTitle: String {
        return self.name ?? ""
    }
    
    var pPrice: String {
        return "\(self.price ?? 0)"
    }
    
    var pDescription: String {
        return self.description ?? ""
    }

}

extension Meal: Equatable {
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.name! == rhs.name!
    }
}

extension Array where Element: Equatable {
    
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

