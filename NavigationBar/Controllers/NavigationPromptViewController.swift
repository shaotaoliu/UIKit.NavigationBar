import UIKit

class NavigationPromptViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.prompt = "Hello, this is a prompt example"
    }

}
