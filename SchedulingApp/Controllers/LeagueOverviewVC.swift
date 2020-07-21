//
//  LeagueOverviewVC.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/19/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class LeagueOverviewVC: UIViewController {

    @IBOutlet var leagueOverviewView: LeagueOverviewView!
    
    let leagueOverviewViewModel: LeagueOverviewViewModel = LeagueOverviewViewModel()
    
    // TODO: MOVE TO CONSTANTS CLASS
    /// Identifier set for the cell in the Interface Builder
    let keyReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Conform to the table view delegate
        leagueOverviewView.tableView.delegate = self
        leagueOverviewView.tableView.dataSource = self
        
        createPickers()
        
        createTheLeague()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Once the segue has been called, pass the job data to the next ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Segue to Job Applicants VC and pass along the corresponding job data
        if segue.destination is TeamInfoVC {
            let viewController = segue.destination as? TeamInfoVC
            viewController?.teamInfoViewModel.teamInfo = self.leagueOverviewViewModel.teamInfo!
        }
    }

    // TODO: CAN I MOVE THIS OUT?
    /// Creates all of the pickers to be used in the VC
    func createPickers() {
        // The picker acts as input for the text field
        leagueOverviewView.selectPoolTextField.inputView = leagueOverviewView.poolPicker

           
        // The toolbars for the picker views
        let doneToolBar = UIToolbar().DoneToolBar(mySelect: #selector(LeagueOverviewVC.dismissPicker))

        self.leagueOverviewView.selectPoolTextField.inputAccessoryView = doneToolBar
        
        leagueOverviewView.poolPicker.delegate = self
        leagueOverviewView.poolPicker.dataSource = self
           
    }
    
    // Creates the league upon first launch
    func createTheLeague() {
        leagueOverviewViewModel.createTheLeague()
    }
    
    /// Dismisses the picker and fills the text field
    @objc func dismissPicker() {
        
        // Shortens the selected option and fills the text field, supports up to 8 Pools total
        if (leagueOverviewView.selectPoolTextField.isEditing) {
            let selectedRow : Int = leagueOverviewView.poolPicker.selectedRow(inComponent: 0)
            
            // Update the chosen pool
            leagueOverviewViewModel.poolNumber = selectedRow
            
            switch selectedRow {
            case 0:
                leagueOverviewView.selectPoolTextField.text = "Pool A"
            case 1:
                leagueOverviewView.selectPoolTextField.text = "Pool B"
            case 2:
                leagueOverviewView.selectPoolTextField.text = "Pool C"
            case 3:
                leagueOverviewView.selectPoolTextField.text = "Pool D"
            case 4:
                leagueOverviewView.selectPoolTextField.text = "Pool E"
            case 5:
                leagueOverviewView.selectPoolTextField.text = "Pool F"
            case 6:
                leagueOverviewView.selectPoolTextField.text = "Pool G"
            case 7:
                leagueOverviewView.selectPoolTextField.text = "Pool H"
            default:
                print("Error filling size of lawn text field")
                
            }
            
            leagueOverviewView.tableView.reloadData()

        }
        // Hide the picker
        view.endEditing(true)
    }

}

