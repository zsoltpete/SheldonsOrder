//
//  Meal.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit
import Intents

class Meal: Codable {
    
    var name: String?
    var price: CGFloat?
    var description: String?
    var mealType: MealTypeEnum?
    
    init(name: String, price: CGFloat, description: String, mealType: MealTypeEnum) {
        self.name = name
        self.price = price
        self.description = description
        self.mealType = mealType
    }
    
    init(intent: OrderMealIntent) {
        let mealTypeHelper = MealTypeHelper()
        
        self.name = intent.meals![0]
        self.price = CGFloat(intent.price?.floatValue ?? 0)
        self.mealType = mealTypeHelper.getMealTypeEnum(orderMealType: intent.type)
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

extension Meal: HistoryCellBindable {
    
    var pimage: UIImage {
        let imageName = (self.mealType?.rawValue ?? "").lowercased()
        return UIImage(named: imageName) ?? UIImage()
    }
    
}

extension Meal: Equatable {
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.name! == rhs.name!
    }
}

extension Meal {
    
    var intent: OrderMealIntent {
        let mealTypeHelper = MealTypeHelper()
        let orderMealIntent = OrderMealIntent()
        
        orderMealIntent.price = NSNumber(value: Double(self.price ?? 0))
        orderMealIntent.meals = [self.name ?? ""]
        orderMealIntent.type = OrderMealType(rawValue: mealTypeHelper.getOrderMealType(mealTypeEnum: self.mealType!))!
        orderMealIntent.setImage(INImage(named: (self.mealType?.rawValue ?? "").lowercased()), forParameterNamed: \.meals)
        
        return orderMealIntent
        
    }
    
}

extension Array where Element: Equatable {
    
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

