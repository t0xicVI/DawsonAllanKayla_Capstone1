//
//  AViewController.swift
//  DawsonAllanKayla_Capstone
//
//  Created by Dawson Michaels on 6/14/21.
//

import UIKit

class AViewController: UIViewController {

    var data = ""
    @IBOutlet weak var userNameDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        userNameDisplay.text = data + "'s Announcements"
    }
    

  

}
