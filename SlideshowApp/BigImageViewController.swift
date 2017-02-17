import UIKit

class BigImageViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
    }
    
  
    @IBOutlet weak var bigImageView: UIImageView!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigImageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
