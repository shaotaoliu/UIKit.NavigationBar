import UIKit

class BackButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // hide the back button of current page
        navigationItem.hidesBackButton = true
        
        // Remove the text of the back button of the next page
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
