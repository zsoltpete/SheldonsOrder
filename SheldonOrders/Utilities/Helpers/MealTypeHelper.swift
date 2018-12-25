//
//  MealTypeHelper.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 25..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import Intents

class MealTypeHelper {
    
    func getOrderMealType(mealTypeEnum: MealTypeEnum) -> Int {
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
    
    func getMealTypeEnum(orderMealType: OrderMealType) -> MealTypeEnum {
        switch orderMealType {
        case .kebab:
            return .Kebab
        case .soup:
            return .Soup
        case .burger:
            return .Burger
        case .pizza:
            return .Pizza
        case .steak:
            return .Steak
        case .protein:
            return .Protein
        case .salad:
            return .Salad
        case .thai:
            return .Thai
        default:
            return .Kebab
        }
    }
    
}
