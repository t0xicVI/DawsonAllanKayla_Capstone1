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
    
    var annouce: Announcements?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        announcements.text = "\((annouce?.title)!) comes under the category \((annouce?.category)!)"
        aDescription.text = "\((annouce?.description)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
