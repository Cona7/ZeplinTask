//
//  EditProfileViewController.swift
//  ZeplinTask
//
//  Created by Josip Glasovac on 28/10/2018.
//  Copyright © 2018 Josip Glasovac. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);
        self.navigationItem.title = "Edit Profile"

//        ageLabel.layer.borderColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0).cgColor
//        ageLabel.layer.borderWidth = 1.0
//        ageLabel.layer.cornerRadius = 4
//        ageLabel.textColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0)
//
//        saveButton.backgroundColor = UIColor(displayP3Red: 47/255, green: 129/255, blue: 183/255, alpha: 1.0)
//        saveButton.layer.cornerRadius = 8
    }
}
