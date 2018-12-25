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
        self.name = intent.meal
        self.price = CGFloat(intent.price?.floatValue ?? 0)
        self.mealType = self.getMealTypeEnum(orderMealType: intent.type.rawValue)
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
        
        let orderMealIntent = OrderMealIntent()
        
        orderMealIntent.price = NSNumber(value: Double(self.price ?? 0))
        orderMealIntent.meal = self.name ?? ""
        orderMealIntent.type = OrderMealType(rawValue: self.getOrderMealType(mealTypeEnum: self.mealType!))!
        orderMealIntent.setImage(INImage(named: (self.mealType?.rawValue ?? "").lowercased()), forParameterNamed: \.meal)
        
        return orderMealIntent
        
    }
    
    private func getOrderMealType(mealTypeEnum: MealTypeEnum) -> Int {
        switch mealTypeEnum {
        case .Kebab:
            return 1
        case .Soup:
            return 2
        case .Burger:
            return 3
        case .Pizza:
            return 4
        case .Steak:
            return 5
        case .Protein:
            return 6
        case .Salad:
            return 7
        case .Thai:
            return 8
        }
    }
    
    private func getMealTypeEnum(orderMealType: Int) -> MealTypeEnum {
        switch orderMealType {
        case 1:
            return .Kebab
        case 2:
            return .Soup
        case 3:
            return .Burger
        case 4:
            return .Pizza
        case 5:
            return .Steak
        case 6:
            return .Protein
        case 7:
            return .Salad
        case 8:
            return .Thai
        default:
            return .Kebab
        }
    }
    
}

extension Array where Element: Equatable {
    
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

