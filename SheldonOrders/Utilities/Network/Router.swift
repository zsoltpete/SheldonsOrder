//
//  Router.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

class Router {
    
    static let shared = Router()
    private var controller: UIViewController?
    
    init() {
        
    }
    
    func push( newController: UIViewController, animated: Bool, completiton: ((Bool) -> Void)? = nil) {
        if let navigationController = self.controller as? UINavigationController {
            self.controller = navigationController.viewControllers[0]
        }
        if let navigationController = self.controller?.navigationController {
            navigationController.pushViewController(newController, animated: animated)
            self.controller = newController
            completiton?(true)
        } else {
            completiton?(false)
        }
        
    }
    
    func initController(storyboardId: String = "Main", controllerId: String, withNavigationController: Bool) {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let newController = storyboard.instantiateViewController(withIdentifier: controllerId)
        if withNavigationController {
            let navigationController = UINavigationController(rootViewController: newController)
            self.controller = navigationController
            AppDelegate.shared.window?.rootViewController = self.controller
        } else {
            self.controller = newController
            AppDelegate.shared.window?.rootViewController = self.controller
        }
        
    }
    
    func push(storyboardId: String = "Main", newControllerId: String, animated: Bool, completiton: ((Bool) -> Void)? = nil) {
        if let navigationController = self.controller as? UINavigationController {
            self.controller = navigationController.viewControllers[0]
        }
        if let navigationController = controller?.navigationController {
            let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
            let newController = storyboard.instantiateViewController(withIdentifier: newControllerId)
            navigationController.pushViewController(newController, animated: animated)
            self.controller = newController
            completiton?(true)
        } else {
            completiton?(false)
        }
    }
    
    func pop(){
        if let navigationController = self.controller?.navigationController {
            self.controller = navigationController.popViewController(animated: false)
        }
    }
    
}
