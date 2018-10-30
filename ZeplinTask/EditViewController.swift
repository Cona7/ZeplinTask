import UIKit

class EditViewController: UITableViewController {

    let arrayTotal: [CellModel] = [CellModel(name: "Total workouts"),
                                   CellModel(name: "Total reps")]

    let arrayMuscles: [CellModel] = [CellModel(name: "Triceps"),
                                     CellModel(name: "Biceps"),
                                     CellModel(name: "Bench")]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Profile"

        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0)

        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"Image-1"), for: .normal)
        menuBtn.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)

        let settingsBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = settingsBarItem.customView?.widthAnchor.constraint(equalToConstant: 22.3)
        currWidth?.isActive = true
        let currHeight = settingsBarItem.customView?.heightAnchor.constraint(equalToConstant: 22.3)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = settingsBarItem
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

extension EditViewController {

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }

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
        if section == 0 {
            return arrayTotal.count
        }
        return arrayMuscles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TypeViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TypeViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }

        let workoutCell = indexPath.section == 0 ? arrayTotal[indexPath.row] : arrayMuscles[indexPath.row]

        cell.stringLabel.text = workoutCell.name
        cell.numberLabel.text = workoutCell.number
        cell.numberLabel.textColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0)
        cell.numberLabel.font = UIFont(name:"Helvetica-Neue", size: 15.0)
        cell.stringLabel.font = UIFont(name:"Helvetica-Neue", size: 17.0)
        cell.stringLabel.letterSpace = 0.4
        cell.numberLabel.letterSpace = 0.04

        return cell
    }
}

struct CellModel {

    let name: String
    let number: String = "8545"
}

