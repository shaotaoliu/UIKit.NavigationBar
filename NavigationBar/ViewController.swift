import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMainViewControl(_ sender: UIStoryboardSegue) {
        if let row = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: row, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            
            func createViewController(_ level: Int) -> UIViewController {
                let controller = UIViewController()
                controller.title = "Level \(level)"
                controller.navigationItem.backButtonTitle = "\(level)"
                controller.view.backgroundColor = .systemBackground
                return controller
            }
            
            for i in 1...4 {
                navigationController?.pushViewController(createViewController(i), animated: false)
            }
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "Level5ViewController") as! Level5ViewController
            controller.title = "Level 5"
            controller.navigationItem.backButtonTitle = "4"
            controller.view.backgroundColor = .systemBackground
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }

    @IBAction func changeStyle(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose a style", message: nil, preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        
        alertController.addAction(UIAlertAction(title: "Default", style: .default) { _ in
            self.navigationController!.navigationBar.barStyle = .default
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            self.navigationController!.navigationBar.tintColor = nil
        })
        
        alertController.addAction(UIAlertAction(title: "Orange", style: .default) { _ in
            self.navigationController!.navigationBar.barStyle = .black
            self.navigationController!.navigationBar.isTranslucent = false
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        })

        self.present(alertController, animated: true, completion: nil)
    }
    
}

