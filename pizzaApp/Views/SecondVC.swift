import UIKit

class SecondVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImage: UIImageView = {
            let image = UIImageView()
            image.image = .bg
            image.frame = UIScreen.main.bounds
            image.contentMode = .scaleAspectFill
            return image
        }()
        view.addSubview(bgImage)
        
    }
}
