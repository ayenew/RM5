import UIKit

class MeetingViewController: UITableViewController {
    var collapseDetailViewController: Bool  = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collapseDetailViewController = false
        performSegue(withIdentifier: "show_meetingdetail_segue_id", sender: self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meetingCell", for: indexPath)
        cell.imageView?.image = UIImage(named: "meeting")
        cell.textLabel?.text = "Meeting \(indexPath.row)"
        cell.detailTextLabel?.text = "06/21/2017"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_meetingdetail_segue_id" {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            var vc = sb.instantiateViewController(withIdentifier: "meetingDetails") as! SampleViewController
            //var detailViewController: DetailViewController!
            
            if let detailNavigationController = segue.destination as? UINavigationController {
                vc = detailNavigationController.topViewController as! SampleViewController
                vc.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                vc.navigationItem.leftItemsSupplementBackButton = true
            }
            else {
                vc = segue.destination as! SampleViewController
            }
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
                vc.meeting = "Meeting \(selectedRowIndexPath.row)"
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "show_meetingdetail_segue_id", sender: self)
        collapseDetailViewController = false
    }
    
    
}
