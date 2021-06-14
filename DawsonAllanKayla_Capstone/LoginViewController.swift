//
//  LoginViewController.swift
//  DawsonAllanKayla_Capstone
//
//  Created by Lisette Antigua on 6/14/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameLogin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = userNameLogin.text ?? ""
        
        let barViewControllers = segue.destination as! UITabBarController
         let destinationViewController = barViewControllers.viewControllers?[0] as! AViewController
        destinationViewController.data = data
    }

}
