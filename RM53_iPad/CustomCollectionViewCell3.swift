import UIKit

class CustomCollectionViewCell3: MasterCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        //let random: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        //title.backgroundColor = UIColor(red: 0.9, green: random, blue: random, alpha: 1)
        let random = Int(arc4random_uniform(6))
        title.backgroundColor = bgColors[random]
    }

}
