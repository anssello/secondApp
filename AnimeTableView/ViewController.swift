import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var titleOfAnime = ""
    var imageName = ""
    var info = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleOfAnime
        imageLabel.image = UIImage(named: imageName)
        infoLabel.text = info
    }
    
}
