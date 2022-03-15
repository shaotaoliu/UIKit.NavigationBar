import UIKit

class BackgroundViewController: UIViewController {

    @IBOutlet var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toolbarItems = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(customView: segment),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ]
        
        setBackgroundColor()
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            setBackgroundColor()
            
        case 1:
            setBackgroundImage()
            
        default:
            setBackgroundGradient()
        }
    }
    
    func setBackgroundColor() {
        guard let bar = navigationController?.navigationBar else {
            return
        }
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.5541667552, green: 0.7134873905, blue: 0.5476607554, alpha: 1)
        
        bar.standardAppearance = appearance
        bar.scrollEdgeAppearance = appearance
        bar.compactAppearance = appearance.copy()
        
        if #available(iOS 15.0, *) {
            bar.compactScrollEdgeAppearance = bar.compactAppearance
        }
    }
    
    func setBackgroundImage() {
        if let image = UIImage(named: "image1") {
            setBackgroundImage(defaultImage: image, landscapeImage: image)
        }
    }
    
    func setBackgroundGradient() {
        guard let bounds = navigationController?.navigationBar.bounds else {
            return
        }
            
        var defaultImage = UIImage.gradientImage(bounds: bounds, colors: [
            UIColor.systemRed.cgColor,
            UIColor.systemFill.cgColor
        ])
        
        var landscapeImage = UIImage.gradientImage(bounds: bounds, colors: [
            UIColor.systemTeal.cgColor,
            UIColor.systemFill.cgColor
        ])
        
        defaultImage = defaultImage.resizableImage(withCapInsets: UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: defaultImage.size.height - 1,
            right: defaultImage.size.width - 1
        ))
        
        landscapeImage = landscapeImage.resizableImage(withCapInsets: UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: landscapeImage.size.height - 1,
            right: landscapeImage.size.width - 1
        ))
   
        setBackgroundImage(defaultImage: defaultImage, landscapeImage: landscapeImage)
    }
    
    private func setBackgroundImage(defaultImage: UIImage?, landscapeImage: UIImage?) {
        guard let bar = navigationController?.navigationBar else {
            return
        }
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundImage = defaultImage
        
        
        let compactAppearance = standardAppearance.copy()
        compactAppearance.backgroundImage = landscapeImage
        
        
        bar.standardAppearance = standardAppearance
        bar.scrollEdgeAppearance = standardAppearance
        bar.compactAppearance = compactAppearance
        
        if #available(iOS 15.0, *) {
            bar.compactScrollEdgeAppearance = compactAppearance
        }
    }
    
}

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
