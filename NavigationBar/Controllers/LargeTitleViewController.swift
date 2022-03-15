import UIKit

class LargeTitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "largeTitleGoNext" {
            segue.destination.navigationItem.largeTitleDisplayMode = .never
        }
    }
}
