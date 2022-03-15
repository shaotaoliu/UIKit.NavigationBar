import UIKit

class AppearanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
    }
    
    func setAppearance() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemYellow
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemPurple]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationItem.backBarButtonItem?.tintColor = .systemRed
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
    }

}
