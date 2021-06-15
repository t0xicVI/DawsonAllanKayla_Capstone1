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
    var image: UIImage
}


class TableViewController: UITableViewController {

    @IBOutlet var tableAnnouncements: UITableView!
    var aArray = [ListOfAnnoucements]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        let jobInternships = ListOfAnnoucements(type: "Jobs/Internships", announcements: [Announcements(title: "Uber Eats Delivery Driver", description: "Delivering with Uber Eats is a great alternative to traditional part-time delivery driver jobs or other part-time employment, temporary jobs, or seasonal work. Or maybe you drive with Uber or are an Uber Eats customer and want to supplement your income. See how becoming a food driver on the Uber platform can help you meet your goals. Uber Eats offers food delivery driver alternatives in major cities across the US, including Austin, Boston, Chicago, Houston, Los Angeles, Miami, New York City, San Francisco, and Seattle—plus hundreds of other cities, large and small, around the country.", image: #imageLiteral(resourceName: "download-2")), Announcements(title: "Amazon", description: "We believe it's also critical for Amazon employees to reflect these diverse perspectives, which helps us in our mission to be earth’s most customer-centric company. We’re looking for current undergraduate and graduate students for internship and full-time opportunities in a variety of roles, including software development engineers (SDEs), support engineers, product managers, operations managers, applied scientists, vendor managers, cloud support associates, sales specialists, financial analysts, and more. We hire for teams across Amazon, including Amazon Web Services (AWS), consumer, devices, finance, legal, operations, and recruiting.", image: #imageLiteral(resourceName: "download-3"))])
        
        let communityService = ListOfAnnoucements(type: "Community Service", announcements: [Announcements(title: "Angel Tree Program (October-December)", description: "Did you know that Seeds of Faith was able to help provide Christmas presents to more than 300 families in our community? Children don’t choose to live in poverty. They are not responsible for their family’s reduced circumstances, yet they must live their lives each day in environments most of us would find appalling and unbearable. Seeds of Faith’s Angel Tree Program attempts to provide much needed clothing items as well as wished-for toys to our community’s neediest kids. Applications are available in late October.\n \nPlease call 211 or visit: www.toysfortots.org to “Request a Toy”", image: #imageLiteral(resourceName: "ToysForTotsLogo")), Announcements(title: "Clothing Voucher Program", description: "If someone was in need of clothes, we would help. The mission was to provide clothing to a greater number of homeless community members. With the Clothing Voucher Program, eligible people could receive clothing absolutely free.\n \nVisit:http://seedsoffaithministries.org/new-beginnings/", image: #imageLiteral(resourceName: "clothes"))])
        
        let programs = ListOfAnnoucements(type: "Programs", announcements: [Announcements(title: "Laptop Upcycle", description: "Laptop Upcycle is a Montclair, NJ based division of HackNCraftNJ, Inc. committed to obtaining, refreshing, and distributing technology to students who need the tools to succeed in school. We believe all public school students should have access to the technology and hardware they need to learn regardless of their family's income level. Laptop Upcycle's mission is to eliminate technology impediments as a part of the achievement gap.​", image: #imageLiteral(resourceName: "download-1")), Announcements(title: "RWC", description: "Real-world connections draw from, or upon, actual objects, events, experiences and situations to effectively address a concept, problem or issue. It involves learning allows students to actually experience or practice concepts and skills, as opposed to learning that is theoretical or idealistic. It features learning projects that directly relate to, are relevant to, or provide benefit to students, their families or the community.", image: #imageLiteral(resourceName: "download"))])

                                    
        aArray.append(jobInternships)
        
        aArray.append(communityService)
        
        aArray.append(programs)

    
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

