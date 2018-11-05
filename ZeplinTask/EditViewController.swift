import UIKit

class EditViewController: UITableViewController {

    struct CellModel {

        let name: String
        let number = "8545"
    }

    let arrayTotal = [
        CellModel(name: "Total workouts"),
        CellModel(name: "Total reps")
    ]

    let arrayMuscles = [
        CellModel(name: "Triceps"),
        CellModel(name: "Biceps"),
        CellModel(name: "Bench")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let menuBtn = UIButton()
        menuBtn.setImage(#imageLiteral(resourceName: "image-1"), for: .normal)
        menuBtn.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)

        let settingsBarItem = UIBarButtonItem(customView: menuBtn)
        navigationItem.rightBarButtonItem = settingsBarItem

        navigationItem.title = "Profile"

        navigationController?.navigationBar.barTintColor = .customBlue
    }

    @objc
    func editButtonTapped() {
        if let editProfileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController {
            if let navigator = navigationController {
                navigator.pushViewController(editProfileViewController, animated: true)
            }
        }
    }
}

extension EditViewController {

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 6.0
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrayTotal.count
        case 1:
            return arrayMuscles.count
        default:
            fatalError("The section number is not valid")
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TypeViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TypeViewCell else {
            fatalError("The dequeued cell is not an instance of TypeViewCell.")
        }

        let workoutCell: CellModel

        switch indexPath.section {
        case 0:
            workoutCell = arrayTotal[indexPath.row]
        case 1:
            workoutCell = arrayMuscles[indexPath.row]
        default:
            fatalError("The section number is not valid")
        }

        cell.stringLabel.text = workoutCell.name
        cell.numberLabel.text = workoutCell.number
        cell.stringLabel.letterSpace = 0.4
        cell.numberLabel.letterSpace = 0.4

        return cell
    }
}
