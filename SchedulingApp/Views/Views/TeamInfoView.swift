//
//  TeamInfoView.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class TeamInfoView: UIView, UITextFieldDelegate {

    let poolPicker = UIPickerView()
    
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var selectPoolTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        // Creates the borders for the specified objects
        // createBorders()
        //FormatButton.makeRound(button: requestButton, cornerRadius: 5)

        selectPoolTextField.delegate = self
            
        // Change the placeholder text color to black
        selectPoolTextField.attributedPlaceholder = NSAttributedString(string: "Select Size",
                                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]) 
        }
}
