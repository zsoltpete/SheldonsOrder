//
//  TypeSelectionMocker.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation

class TypeSelectionMocker {
    
    init() {
        
    }
    
    func getMeal(for type: MealType?) -> [Meal] {
        switch (type?.type ?? .Kebab) {
        case .Kebab:
            return self.getKebabMeals()
        case .Soup:
            return self.getSoupMeals()
        case .Burger:
            return self.getBurgerMeals()
        case .Pizza:
            return self.getPizzaMeals()
        case .Steak:
            return self.getSteakMeals()
        case .Protein:
            return self.getProteinMeals()
        case .Salad:
            return self.getSaladMeals()
        case .Thai:
            return self.getThaiMeals()
        }
    }
    
    private func getKebabMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Kebab.Option1.Name".localized, price: 10, description: "Kebab.Option1.Description".localized, mealType: .Kebab))
        meals.append(Meal(name: "Kebab.Option2.Name".localized, price: 3, description: "Kebab.Option2.Description".localized, mealType: .Kebab))
        meals.append(Meal(name: "Kebab.Option3.Name".localized, price: 13, description: "Kebab.Option3.Description".localized, mealType: .Kebab))
        return meals
    }
    
    private func getSoupMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Soup.Option1.Name".localized, price: 9, description: "Soup.Option1.Description".localized, mealType: .Soup))
        meals.append(Meal(name: "Soup.Option2.Name".localized, price: 7, description: "Soup.Option2.Description".localized, mealType: .Soup))
        meals.append(Meal(name: "Soup.Option3.Name".localized, price: 10, description: "Soup.Option3.Description".localized, mealType: .Soup))
        return meals
    }
    
    private func getBurgerMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Burger.Option1.Name".localized, price: 9, description: "Burger.Option1.Description".localized, mealType: .Burger))
        meals.append(Meal(name: "Burger.Option2.Name".localized, price: 7, description: "Burger.Option2.Description".localized, mealType: .Burger))
        meals.append(Meal(name: "Burger.Option3.Name".localized, price: 10, description: "Burger.Option3.Description".localized, mealType: .Burger))
        return meals
    }
    
    private func getPizzaMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Pizza.Option1.Name".localized, price: 9, description: "Pizza.Option1.Description".localized, mealType: .Pizza))
        meals.append(Meal(name: "Pizza.Option2.Name".localized, price: 7, description: "Pizza.Option2.Description".localized, mealType: .Pizza))
        meals.append(Meal(name: "Pizza.Option3.Name".localized, price: 10, description: "Pizza.Option3.Description".localized, mealType: .Pizza))
        return meals
    }
    
    private func getSteakMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Steak.Option1.Name".localized, price: 9, description: "Steak.Option1.Description".localized, mealType: .Steak))
        meals.append(Meal(name: "Steak.Option2.Name".localized, price: 7, description: "Steak.Option2.Description".localized, mealType: .Steak))
        meals.append(Meal(name: "Steak.Option3.Name".localized, price: 10, description: "Steak.Option3.Description".localized, mealType: .Steak))
        return meals
    }
    
    private func getProteinMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Protein.Option1.Name".localized, price: 9, description: "Protein.Option1.Description".localized, mealType: .Protein))
        meals.append(Meal(name: "Protein.Option2.Name".localized, price: 7, description: "Protein.Option2.Description".localized, mealType: .Protein))
        meals.append(Meal(name: "Protein.Option3.Name".localized, price: 10, description: "Protein.Option3.Description".localized, mealType: .Protein))
        return meals
    }
    
    private func getSaladMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Salad.Option1.Name".localized, price: 9, description: "Salad.Option1.Description".localized, mealType: .Salad))
        meals.append(Meal(name: "Salad.Option2.Name".localized, price: 7, description: "Salad.Option2.Description".localized, mealType: .Salad))
        meals.append(Meal(name: "Salad.Option3.Name".localized, price: 10, description: "Salad.Option3.Description".localized, mealType: .Salad))
        return meals
    }
    
    private func getThaiMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Thai.Option1.Name".localized, price: 9, description: "Thai.Option1.Description".localized, mealType: .Thai))
        meals.append(Meal(name: "Thai.Option2.Name".localized, price: 7, description: "Thai.Option2.Description".localized, mealType: .Thai))
        meals.append(Meal(name: "Thai.Option3.Name".localized, price: 10, description: "Thai.Option3.Description".localized, mealType: .Thai))
        return meals
    }
}
