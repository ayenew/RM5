import UIKit

struct Company {
    let name: String
    let address: String
}

class RelationshipTableViewController: UITableViewController {
    
    fileprivate let CellIdentifier = "relationshipCell"
    
    var collapseDetailViewController: Bool  = true
    
//    fileprivate let company = [
//        Company(displayName: "Green", color: UIColor.green),
//        Company(displayName: "Blue", color: UIColor.blue),
//        Company(displayName: "Yellow", color: UIColor.yellow),
//        Company(displayName: "Purple", color: UIColor.purple),
//        Company(displayName: "Orange", color: UIColor.orange),
//        Company(displayName: "Magenta", color: UIColor.magenta),
//        Company(displayName: "Brown", color: UIColor.brown),
//        Company(displayName: "Cyan", color: UIColor.cyan),
//        Company(displayName: "Red", color: UIColor.red)
//    ]
    
    override func viewDidLoad() {
        self.title = "Relationships"
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_detail_segue_id" {
            var detailViewController: DetailViewController!
            
            if let detailNavigationController = segue.destination as? UINavigationController {
                
                detailViewController = detailNavigationController.topViewController as! DetailViewController
                detailViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                detailViewController.navigationItem.leftItemsSupplementBackButton = true
            } else {
                detailViewController = segue.destination as! DetailViewController
            }
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
                let company = relationshipRepo[selectedRowIndexPath.row]
                detailViewController.company = company
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relationshipRepo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = relationshipRepo[indexPath.row]["name"] as! String?
        cell.detailTextLabel?.text = relationshipRepo[indexPath.row]["address"] as! String?
        cell.imageView?.image = UIImage(named: "business")
        
        return cell
    }
    
    // MARK: Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        collapseDetailViewController = false
    }
    
}
