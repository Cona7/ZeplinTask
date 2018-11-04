import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!

    @IBOutlet weak var heightSegmentedControl: UISegmentedControl!
    @IBOutlet weak var weightSegmentedControl: UISegmentedControl!

    @IBOutlet weak var saveButton: UIButton!

    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Edit Profile"

        initUITextField(ageTextField)
        initUITextField(heightTextField)
        initUITextField(weightTextField)

        initUISegmentedControl(heightSegmentedControl)
        initUISegmentedControl(weightSegmentedControl)

        saveButton.backgroundColor = .customBlue
        saveButton.layer.cornerRadius = 8

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tapGestrure = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.dismissKeyboard))

        view.addGestureRecognizer(tapGestrure)
    }

    func initUITextField(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.customBlue.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4
        textField.textColor = .customBlue
        textField.setLeftPaddingPoints(3)
    }

    func initUISegmentedControl(_ segmentedControl: UISegmentedControl) {
        segmentedControl.tintColor = .customBlue
        segmentedControl.layer.cornerRadius = 4
    }

    @objc
    func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            keyboardSize.origin.y < (weightTextField.frame.origin.y + weightTextField.frame.height) {
                let constantToRaiseConstraint = keyboardSize.origin.y - weightTextField.frame.origin.y - weightTextField.frame.height - 20
                imageViewTopConstraint.constant += constantToRaiseConstraint
                buttonBottomConstraint.constant -= constantToRaiseConstraint
                view.layoutIfNeeded()
        }
    }

    @objc
    func keyboardWillHide(notification: Notification) {
        if imageViewTopConstraint.constant != 50 {
            imageViewTopConstraint.constant = 50
            buttonBottomConstraint.constant = 40
            view.layoutIfNeeded()
        }
    }

    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

extension EditProfileViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
