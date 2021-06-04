//
//  TableViewController.swift
//  DawsonAllanKayla_Capstone
//
//  Created by Lisette Antigua on 6/4/21.
//

import UIKit

class Announcements {
    var title: String?
    var category: String?
    var description: String?

    init(title:String, category:String, description: String) {
        self.title = title
        self.category = category
        self.description = description
    }
}


class TableViewController: UITableViewController {

    @IBOutlet var tableAnnouncements: UITableView!
    var aArray = [Announcements]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let macBook = Announcements(title: "MackBook pro", category: "Laptop", description: "This is a description")
        aArray.append(macBook)
        let macBookAir = Announcements(title: "MackBook air", category: "Laptop", description: "This is a description")
        aArray.append(macBookAir)
        
        
        tableAnnouncements.dataSource = self
        tableAnnouncements.delegate = self

    }
    
    
    //MARK:- UITableView methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "announcementstable")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "announcementstable")
        }
        
        cell?.textLabel?.text = aArray[indexPath.row].title
        cell?.detailTextLabel?.text = aArray[indexPath.row].category
        
        return cell!
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TableDetailsVC {
            destination.annouce = aArray[(tableAnnouncements.indexPathForSelectedRow?.row)!]
            tableAnnouncements.deselectRow(at: tableAnnouncements.indexPathForSelectedRow!, animated: true)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

