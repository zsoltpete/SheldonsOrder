//
//  MealTypeMocker.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation

class MealTypeMocker {
    
    init() {
        
    }
    
    func getMealType() -> [MealType] {
        var mealTypes = [MealType]()
        
        mealTypes.append(MealType(type: .Kebab, imageUrl: "kebab"))
        mealTypes.append(MealType(type: .Soup, imageUrl: "soup"))
        mealTypes.append(MealType(type: .Burger, imageUrl: "burger"))
        mealTypes.append(MealType(type: .Pizza, imageUrl: "pizza"))
        mealTypes.append(MealType(type: .Steak, imageUrl: "steak"))
        mealTypes.append(MealType(type: .Protein, imageUrl: "protein"))
        mealTypes.append(MealType(type: .Salad, imageUrl: "salad"))
        mealTypes.append(MealType(type: .Thai, imageUrl: "thai"))
        
        
        return mealTypes
    }
    
}
