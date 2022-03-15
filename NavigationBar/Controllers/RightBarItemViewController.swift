import UIKit

class RightBarItemViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            let addButton = UIBarButtonItem(
                title: "Add",
                style: .plain,
                target: self,
                action: #selector(rightBarTapped(_:)))
            
            navigationItem.rightBarButtonItem = addButton
            
        case 1:
            let emailButton = UIBarButtonItem(
                image: UIImage(systemName: "envelope")!,
                style: .plain,
                target: self,
                action: #selector(rightBarTapped(_:)))
            
            navigationItem.rightBarButtonItem = emailButton
            
        case 2:
            let segment = UISegmentedControl(items: [
                UIImage(systemName: "arrow.up")!,
                UIImage(systemName: "arrow.down")!
            ])
            
            segment.addTarget(self, action: #selector(rightBarTapped(_:)), for: .valueChanged)
            segment.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
            segment.isMomentary = true
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segment)
            
        default:
            break
        }
    }
    
    @objc func rightBarTapped(_ sender: Any) {
        Swift.debugPrint("Right bar tapped.")
    }
}
