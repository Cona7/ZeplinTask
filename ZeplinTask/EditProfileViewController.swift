import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet private weak var ageTextField: UITextField!
    @IBOutlet private weak var heightTextField: UITextField!
    @IBOutlet private weak var weightTextField: UITextField!

    @IBOutlet private weak var heightSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var weightSegmentedControl: UISegmentedControl!

    @IBOutlet private weak var saveButton: UIButton!

    @IBOutlet private weak var upKeyboardConstraints: NSLayoutConstraint!
    @IBOutlet private weak var upbuttonKeyboardContraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Edit Profile"

        initUITextField(ageTextField)
        initUITextField(heightTextField)
        initUITextField(weightTextField)

        heightSegmentedControl.tintColor = .customBlue
        heightSegmentedControl.layer.cornerRadius = 4

        weightSegmentedControl.tintColor = .customBlue
        weightSegmentedControl.layer.cornerRadius = 4

        saveButton.backgroundColor = .customBlue
        saveButton.layer.cornerRadius = 8

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)

        self.ageTextField.delegate = self
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
    }

    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc
    func keyboardWillShow(sender: Notification) {
        upKeyboardConstraints.constant = -90
        upbuttonKeyboardContraint.constant = 180
        self.view.layoutIfNeeded()
    }

    @objc
    func keyboardWillHide(sender: Notification) {
        upKeyboardConstraints.constant = 50
        upbuttonKeyboardContraint.constant = 40
         self.view.layoutIfNeeded()
    }

    func initUITextField(_ textField: UITextField) {

        textField.layer.borderColor = UIColor.customBlue.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4
        textField.textColor = .customBlue
        textField.setLeftPaddingPoints(3)
    }
}

extension EditProfileViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
