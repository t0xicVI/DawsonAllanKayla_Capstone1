//
//  TableViewController.swift
//  DawsonAllanKayla_Capstone
//
//  Created by Lisette Antigua on 6/4/21.
//

import UIKit


struct ListOfAnnoucements{
    
    var type:String
    var announcements:[Announcements]
    
}
struct Announcements {
    var title: String
    var description: String
}


class TableViewController: UITableViewController {

    @IBOutlet var tableAnnouncements: UITableView!
    var aArray = [ListOfAnnoucements]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
let state = ListOfAnnoucements(type: "State", announcements: [Announcements(title: "State Announcement", description: "this is a state announcement"), Announcements(title: "State2", description:"Another state")])
let county = ListOfAnnoucements(type: "County", announcements: [Announcements(title: "County Announcement", description: "this is a County announcement")])
let city = ListOfAnnoucements(type: "City", announcements:[Announcements(title: "City Announcement", description: "this is a City announcement"), Announcements(title: "City 2", description: "This is second city announcement ")])
        
        aArray.append(city)
        aArray.append(county)
        aArray.append(state)
    
        tableAnnouncements.dataSource = self
        tableAnnouncements.delegate = self

    }
    
    
    //MARK:- UITableView methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  aArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return aArray[section].announcements.count

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let announce = aArray[section]
        
        return announce.type
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "announcementstable")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "announcementstable")
        }
        
        let announce = aArray[indexPath.section]
        let announce2 = announce.announcements[indexPath.row]
        
        // Configure the cell...
        cell?.textLabel?.text = announce2.title
        cell?.detailTextLabel?.text = announce2.description
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
          
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           //lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = UIColor.red
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.text = aArray[section].type
           view.addSubview(lbl)
           return view
         }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
    }
         
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 40
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TableDetailsVC {
            destination.annouce = aArray[(tableAnnouncements.indexPathForSelectedRow?.section)!]
            destination.indexpath = tableAnnouncements.indexPathForSelectedRow?.row ?? 0
            tableAnnouncements.deselectRow(at: tableAnnouncements.indexPathForSelectedRow!, animated: true)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

