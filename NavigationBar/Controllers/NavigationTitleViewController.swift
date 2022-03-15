import UIKit

class NavigationTitleViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    private let segment2: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Image", "Text", "Video"])
        seg.selectedSegmentIndex = 0
        seg.autoresizingMask = .flexibleWidth
        seg.frame = CGRect(x: 0, y: 0, width: 250, height: 30)
        return seg
    }()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func changeTitle(_ sender: Any) {
        navigationItem.titleView = segment2
    }
    
}
