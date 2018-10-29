import UIKit

class EditViewController: UITableViewController {
    
//    @IBOutlet var labelsOfNumbers: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0)

//        for label in labelsOfNumbers {
//            label.textColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0)
//        }

        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"Image-1"), for: .normal)
        menuBtn.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 22.3)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 22.3)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
    }

    @objc
    func editButtonTapped(){
        if let editProfileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController {
            if let navigator = navigationController {
                navigator.pushViewController(editProfileViewController, animated: true)
            }
        }
    }
}

