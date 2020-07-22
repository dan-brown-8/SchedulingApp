//
//  LeagueOverviewView.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class LeagueOverviewView: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var selectPoolTextField: UITextField!
    @IBOutlet weak var leagueScheduleButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    let poolPicker = UIPickerView()
        
    override func awakeFromNib() {
        super.awakeFromNib()
            
        // Creates the borders for the specified objects
        // createBorders()
        //FormatButton.makeRound(button: requestButton, cornerRadius: 5)

        selectPoolTextField.delegate = self
            
        // Change the placeholder text color to black
        selectPoolTextField.attributedPlaceholder = NSAttributedString(string: "Select Pool",
                                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
        
   /*     func createBorders() {
            
            Borders.createThinBorders(textFieldName: dateTextField)
            Borders.createThinBorders(textFieldName: timeTextField)
            Borders.createThinBorders(textViewName: notesTextView)
            Borders.createThinBorders(textFieldName: jobSizeTextField)
            Borders.createThinBorders(textFieldName: jobTypeTextField)
            
            Borders.createThinBorders(buttonName: requestButton)
        } */

}
        
