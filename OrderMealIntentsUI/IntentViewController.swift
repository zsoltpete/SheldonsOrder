//
//  IntentViewController.swift
//  OrderMealIntentsUI
//
//  Created by Zsolt Pete on 2018. 12. 23..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import Intents
import IntentsUI
import CYLocalization

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet var invoiceView: InvoiceView!
    @IBOutlet var confirmView: ConfirmView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        
        guard let intent = interaction.intent as? OrderMealIntent else {
            completion(false, Set(), .zero)
            return
        }
        
        let meal = Meal(intent: intent)
        
        for view in view.subviews {
            view.removeFromSuperview()
        }
        
        var desiredSize = CGSize.zero
        
        if interaction.intentHandlingStatus == .ready {
            desiredSize = self.displayInvoice(meal)
        } else if interaction.intentHandlingStatus == .success {
            desiredSize = self.displayConfirm(meal)
        }
        
        
        
        completion(true, parameters, desiredSize)
    }
    
    private func displayInvoice(_ meal: Meal) -> CGSize{
        self.invoiceView.priceLabel.text = "\(meal.price ?? 0)"
        self.invoiceView.titleLabel.text = meal.name
        self.invoiceView.imageView.image = UIImage(named: meal.mealType?.rawValue.lowercased() ?? "") ?? UIImage()
        
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        let frame = CGRect(origin: .zero, size: CGSize(width: width, height: 170))
        
        self.view.addSubview(self.invoiceView)
        
        self.invoiceView.frame = frame
        
        return frame.size
    }
    
    private func displayConfirm(_ meal: Meal) -> CGSize {
        self.confirmView.titleLabel.text = "ConfirmView.Ordered".localized
        self.confirmView.imageView.image = UIImage(named: meal.mealType?.rawValue.lowercased() ?? "") ?? UIImage()
        
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        let frame = CGRect(origin: .zero, size: CGSize(width: width, height: 170))
        
        self.view.addSubview(self.confirmView)
        
        self.confirmView.frame = frame
        
        return frame.size
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
