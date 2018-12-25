//
//  IntentHandler.swift
//  OrderMealIntents
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Intents

class IntentHandler: INExtension, OrderMealIntentHandling {
    
    func confirm(intent: OrderMealIntent, completion: @escaping (OrderMealIntentResponse) -> Void) {
        
        completion(OrderMealIntentResponse(code: .ready, userActivity: nil))
        
    }
    
    func handle(intent: OrderMealIntent, completion: @escaping (OrderMealIntentResponse) -> Void) {
        
        let meals = IntentManager.shared.createMeals(intent: intent)
        OrderManager.shared.add(meals: meals)
        OrderManager.shared.completeOrder()
        
        completion(OrderMealIntentResponse(code: .success, userActivity: nil))
        
    }
    
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
