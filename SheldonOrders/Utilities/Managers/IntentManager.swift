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
    
    func donateMealIntent(meal: Meal){
        
        let interaction = INInteraction(intent: meal.intent, response: nil)
        interaction.donate { error in
            if let error = error {
                print(error)
            }
        }
        
    }
    
}
