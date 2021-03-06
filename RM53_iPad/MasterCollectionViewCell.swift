import UIKit

class MasterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UIButton!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var graph: UIImageView!
    @IBOutlet weak var amount2: UILabel!
    @IBOutlet weak var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        let random: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
//        title.backgroundColor = UIColor(red: 0.7, green: random, blue: random, alpha: 1)
        let random = Int(arc4random_uniform(6))
        title.backgroundColor = bgColors[random]
    }
    
}
