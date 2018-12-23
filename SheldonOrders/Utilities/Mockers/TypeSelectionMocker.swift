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
        switch (type?.name ?? "") {
        case "Kebab":
            return self.getKebabMeals()
        default:
            return []
        }
    }
    
    private func getKebabMeals() -> [Meal] {
        var meals = [Meal]()
        meals.append(Meal(name: "Döner", price: 10, description: "Az Oszmán Birodalom első fővárosához kötődő 'Bursa kebabı' utcai változata a Döner kebab a függőlegesen forgó nyársról levágott grillezett húsra utal, a görög gíroszhoz vagy az arab suvarmához hasonlatosan. A sütés közben folyamatosan szeletelik a húst a hatalmas nyársról, ennek köszönhetően, mire eljutnak a közepéig, addigra az is átsül, és a nyársra feltűzött hús minden része fogyaszthatóvá válik. Eredetileg tányéron szolgálták fel az ilyen módon készített kebabot, az utcai változatát tésztából készült pitába teszik a hozzávaló öntettel és salátával együtt."))
        meals.append(Meal(name: "Kis Döner", price: 5, description: "Az Oszmán Birodalom első fővárosához kötődő 'Bursa kebabı' utcai változata a Döner kebab a függőlegesen forgó nyársról levágott grillezett húsra utal, a görög gíroszhoz vagy az arab suvarmához hasonlatosan. A sütés közben folyamatosan szeletelik a húst a hatalmas nyársról, ennek köszönhetően, mire eljutnak a közepéig, addigra az is átsül, és a nyársra feltűzött hús minden része fogyaszthatóvá válik. Eredetileg tányéron szolgálták fel az ilyen módon készített kebabot, az utcai változatát tésztából készült pitába teszik a hozzávaló öntettel és salátával együtt."))
        meals.append(Meal(name: "Nagy Döner", price: 12, description: "Az Oszmán Birodalom első fővárosához kötődő 'Bursa kebabı' utcai változata a Döner kebab a függőlegesen forgó nyársról levágott grillezett húsra utal, a görög gíroszhoz vagy az arab suvarmához hasonlatosan. A sütés közben folyamatosan szeletelik a húst a hatalmas nyársról, ennek köszönhetően, mire eljutnak a közepéig, addigra az is átsül, és a nyársra feltűzött hús minden része fogyaszthatóvá válik. Eredetileg tányéron szolgálták fel az ilyen módon készített kebabot, az utcai változatát tésztából készült pitába teszik a hozzávaló öntettel és salátával együtt."))
        return meals
    }
}
