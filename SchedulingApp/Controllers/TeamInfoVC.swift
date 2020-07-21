//
//  TeamViewController.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/19/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class TeamInfoVC: UIViewController {
    
    var teamInfoViewModel: TeamInfoViewModel?
    
    @IBOutlet var teamInfoView: TeamInfoView!
    
    let keyReuseIdentifier = "cell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Conform to the table view delegate
        teamInfoView.tableView.delegate = self
        teamInfoView.tableView.dataSource = self
          
        teamInfoView.teamNameTextField.text = teamInfoViewModel!.teamInfo?.teamName
        teamInfoView.selectPoolTextField.text = teamInfoViewModel!.poolName
        
        createPickers()
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // If the team name has changed, perform the necessary functions
        if (self.teamInfoViewModel!.teamInfo!.teamName != self.teamInfoView.teamNameTextField.text && self.teamInfoView.teamNameTextField.text != "") {
            
            self.teamInfoViewModel!.changeTeamName(newName: self.teamInfoView.teamNameTextField.text!)
        }

    }

    // TODO: CAN I MOVE THIS OUT?
    /// Creates all of the pickers to be used in the VC
    func createPickers() {
        // The picker acts as input for the text field
        teamInfoView.selectPoolTextField.inputView = teamInfoView.poolPicker

        // The toolbars for the picker views
        let doneToolBar = UIToolbar().DoneToolBar(mySelect: #selector(TeamInfoVC.dismissPicker))

        self.teamInfoView.selectPoolTextField.inputAccessoryView = doneToolBar
            
        teamInfoView.poolPicker.delegate = self
        teamInfoView.poolPicker.dataSource = self
               
    }
        
    /// Dismisses the picker and fills the text field
    @objc func dismissPicker() {
            
        // Shortens the selected option and fills the text field, supports up to 8 Pools total
        if (teamInfoView.selectPoolTextField.isEditing) {
            let selectedRow : Int = teamInfoView.poolPicker.selectedRow(inComponent: 0)
                
            // Update the chosen pool
            teamInfoViewModel!.poolNumber = selectedRow
                
            switch selectedRow {
                case 0:
                    teamInfoView.selectPoolTextField.text = "Pool A"
                case 1:
                    teamInfoView.selectPoolTextField.text = "Pool B"
                case 2:
                    teamInfoView.selectPoolTextField.text = "Pool C"
                case 3:
                    teamInfoView.selectPoolTextField.text = "Pool D"
                case 4:
                    teamInfoView.selectPoolTextField.text = "Pool E"
                case 5:
                    teamInfoView.selectPoolTextField.text = "Pool F"
                case 6:
                    teamInfoView.selectPoolTextField.text = "Pool G"
                case 7:
                    teamInfoView.selectPoolTextField.text = "Pool H"
                default:
                    print("Error filling size of lawn text field")
                    
            }
            
            // If the pool number has changed, perform the necessary functions
            if (self.teamInfoViewModel?.poolNumber != self.teamInfoViewModel?.originalPoolNumber) {
                print("Update the league to show that the pool has changed")
                
                self.teamInfoViewModel!.changePool()
            }
                
            teamInfoView.tableView.reloadData()

        }
        // Hide the picker
        view.endEditing(true)
    }

 



}

