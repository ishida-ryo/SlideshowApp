import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
  //配列の番号
    var imageNo = 0
    var timer: Timer? = nil
    
    
    func displayImage(){
        //画像名前の配列
        let imageArray = ["悟空", "悟空2", "悟空3"]
        
        if imageNo > 2 {
            imageNo = 0
        }
        if imageNo < 0 {
            imageNo = 2
        }
        
        //配列の名前と番号
        let name = imageArray[imageNo]
        //上で指定した画像を代入
        let image = UIImage(named: name)
        //代入した画像を表示
        imageView.image = image
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        //画像を表示
            let image = UIImage(named: "悟空")
        imageView.image = image
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// 進むボタン
    @IBAction func nextButton(_ sender: UIButton) {
        imageNo += 1
        displayImage()
           }
    
//戻るボタン
    @IBAction func prevButton(_ sender: UIButton) {
        imageNo -= 1
        displayImage()
    }
    
//再生/一時停止ボタン
    @IBAction func playPouseButton(_ sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextButton(_:)), userInfo: nil, repeats: true)
            timer?.fire()
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        } else {
            timer?.invalidate()
            timer = nil
            nextButton.isEnabled = true
            prevButton.isEnabled = true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let bigImageViewController = segue.destination as! BigImageViewController
        bigImageViewController.image = imageView.image
        
        timer?.invalidate()
        timer = nil
        nextButton.isEnabled = true
        prevButton.isEnabled = true

        
    }
    
    @IBAction func segueButton(_ sender: Any) {
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
        }
    }
