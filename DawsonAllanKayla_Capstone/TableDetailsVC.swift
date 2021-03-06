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
    
    @IBOutlet weak var aImage: UIImageView!
    var annouce: ListOfAnnoucements!
    var indexpath:Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        announcements.text = "\((annouce.announcements[indexpath].title))"
        aDescription.text = "\((annouce.announcements[indexpath].description))"
        
        aImage.image = ((annouce.announcements[indexpath].image))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
