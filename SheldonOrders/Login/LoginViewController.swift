//
//  LoginViewController.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 05..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit
import PixelPerfectSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: LoginButton!
    @IBOutlet weak var passwordBottomBorderView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailBottomBorderView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mainTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleComponents()
        self.addLocalization()
        self.addFonts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func styleComponents(){
        self.mainTitleLabel.textColor = Colors.Login.MainTitle
        self.emailLabel.textColor = Colors.Login.LoginItemTitle
        self.passwordLabel.textColor = Colors.Login.LoginItemTitle
        self.emailBottomBorderView.backgroundColor = Colors.Login.LoginItemBottomBorder
        self.passwordBottomBorderView.backgroundColor = Colors.Login.LoginItemBottomBorder
    }
    
    func addLocalization(){
        self.mainTitleLabel.text = "Sheldon's\nOrder"
        self.emailLabel.text = "Email address:"
        self.passwordLabel.text = "Password:"
        self.loginButton.setTitle("Login", for: .normal)
    }
    
    func addFonts(){
        self.mainTitleLabel.font = Fonts.Login.MainTitle
        self.emailLabel.font = Fonts.Login.LoginnItem
        self.passwordLabel.font = Fonts.Login.LoginnItem
    }
    
    @IBAction func login(_ sender: Any) {
        Router.shared.push(newControllerId: StoryboardIds.MealTypesViewController, animated: true, completiton: nil)
    }
    
}
