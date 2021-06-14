//
//  SignUpViewController.swift
//  DawsonAllanKayla_Capstone
//
//  Created by Lisette Antigua on 6/14/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameSign: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = usernameSign.text ?? ""
        
        let barViewControllers = segue.destination as! UITabBarController
         let destinationViewController = barViewControllers.viewControllers?[0] as! AViewController
        destinationViewController.data = data
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
