import UIKit

class SampleViewController: UIViewController {
    var meeting: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        if let meeting = meeting {
            self.title = meeting + " Details"
        } else{
            self.title = "All Meetings"
        }

        self.view.backgroundColor = UIColor.white
    }
}
