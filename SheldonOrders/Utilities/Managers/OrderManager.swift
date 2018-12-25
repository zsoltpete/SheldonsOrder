//
//  OrderManager.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation

class OrderManager {
    
    var items = [Meal]()
    
    static let shared = OrderManager()
    
    private init() {
        
    }
    
    func add(meal: Meal) {
        self.items.append(meal)
        
        
    }
    
    func getAllOrderedMeals() -> [Meal] {
        
        var meals = [Meal]()
        
        if let userDefaults = UserDefaults(suiteName: "group.eu.codeyard.SheldonOrders.Shared") {
            if let mealsData = userDefaults.data(forKey: "Meals") {
                meals = try! JSONDecoder().decode([Meal].self, from: mealsData)
            }
            
        }
        
        return meals
        
    }
    
    func remove(meal: Meal){
        self.items.remove(object: meal)
    }
    
    func completeOrder(){
        if !self.items.isEmpty {
            var orderedItems = self.getAllOrderedMeals()
            orderedItems.append(contentsOf: self.items)
            if let userDefaults = UserDefaults(suiteName: "group.eu.codeyard.SheldonOrders.Shared") {
                let mealsData = try! JSONEncoder().encode(orderedItems)
                userDefaults.set(mealsData, forKey: "Meals")
            }
            IntentManager.shared.donateMealIntent(meal: self.items[0])
        }
        self.items = []
    }
    
}
