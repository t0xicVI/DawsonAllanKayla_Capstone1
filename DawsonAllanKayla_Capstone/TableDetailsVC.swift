//
//  TableDetailsVC.swift
//  DawsonAllanKayla_Capstone
//
//  Created by Lisette Antigua on 6/4/21.
//

import UIKit

class TableDetailsVC: UIViewController {

    @IBOutlet weak var aDescription: UILabel!
    @IBOutlet weak var announcements: UILabel!
    
    var annouce: ListOfAnnoucements!
    var indexpath:Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        announcements.text = "\((annouce.type))"
        aDescription.text = "\((annouce.announcements[indexpath].description))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
