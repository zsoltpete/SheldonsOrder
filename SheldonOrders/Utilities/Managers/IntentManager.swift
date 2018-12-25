//
//  IntentManager.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import Intents
import CoreServices
import CoreSpotlight

class IntentManager {
    
    static let shared = IntentManager()
    
    private init() {
        
    }
    
    func donateMealIntent(meals: [Meal]){
        
        let interaction = INInteraction(intent: self.createMealIntent(meals: meals), response: nil)
        interaction.donate { error in
            if let error = error {
                print(error)
            }
        }
        
    }
    
    func createMealIntent(meals: [Meal]) -> OrderMealIntent {
        
        let helper = MealTypeHelper()
        
        let orderMealIntent = OrderMealIntent()
        
        var count = 0.0
        orderMealIntent.meals = [String]()
        
        for meal in meals {
            orderMealIntent.meals?.append(meal.name ?? "")
            orderMealIntent.type = OrderMealType(rawValue: helper.getOrderMealType(mealTypeEnum: meal.mealType!))!
            count += Double(meal.price ?? 0)
        }
        orderMealIntent.price = NSNumber(value: count)
        orderMealIntent.setImage(INImage(named: (meals[0].mealType?.rawValue ?? "").lowercased()), forParameterNamed: \.meals)
        
        return orderMealIntent
    }
    
    func createMeals(intent: OrderMealIntent) -> [Meal] {
        
        let mealTypeHelper = MealTypeHelper()
        
        var meals = [Meal]()

        
        for name in intent.meals ?? [] {
            let meal = Meal(name: name, price: 0, description: "", mealType: mealTypeHelper.getMealTypeEnum(orderMealType: intent.type))
            meals.append(meal)
        }
        
        
        return meals
    }
    
}
