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
        
        mealTypes.append(MealType(name: "Kebab", imageUrl: "kebab"))
        mealTypes.append(MealType(name: "Soup", imageUrl: "soup"))
        mealTypes.append(MealType(name: "Burger", imageUrl: "burger"))
        mealTypes.append(MealType(name: "Pizza", imageUrl: "pizza"))
        mealTypes.append(MealType(name: "Steak", imageUrl: "steak"))
        mealTypes.append(MealType(name: "Protein", imageUrl: "protein"))
        mealTypes.append(MealType(name: "Salad", imageUrl: "salad"))
        mealTypes.append(MealType(name: "Thai", imageUrl: "thai"))
        
        
        return mealTypes
    }
    
}
