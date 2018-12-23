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
    
    func remove(meal: Meal){
        self.items.remove(object: meal)
    }
    
    func completeOrder(){
        self.items = []
    }
    
}
