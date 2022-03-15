import UIKit

class BarMenuViewController: UIViewController {

    @IBOutlet weak var optionsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        optionsButton.menu = UIMenu(title: "", children: [
            UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc"), handler: menuClicked),

            UIAction(title: "Rename", image: UIImage(systemName: "pencil"), handler: menuClicked),

            UIAction(title: "Move", image: UIImage(systemName: "folder"), handler: menuClicked)
        ])
    }
    
    func menuClicked(action: UIAction) {
        switch action.title {
        case "Copy":
            Swift.debugPrint("Copy")

        case "Rename":
            Swift.debugPrint("Rename")

        default:
            Swift.debugPrint("Move")
        }
    }
}
