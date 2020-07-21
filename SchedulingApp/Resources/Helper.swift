//
//  Helper.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

/*import Foundation
import UIKit

class Helper {
    
  //  createPickers(view: teamInfoView, viewModel: teamInfoViewModel)
        
    

    /// Creates all of the pickers to be used in the VC
    static func createPickers(view: UIView, viewModel: Int) {
        
        // The picker acts as input for the text field
        view.selectPoolTextField.inputView = view.poolPicker
               
        // The toolbars for the picker views
        let doneToolBar = UIToolbar().DoneToolBar(mySelect: #selector(Helper.dismissPicker(view: view, viewModel: viewModel)))
        
        view.selectPoolTextField.inputAccessoryView = doneToolBar
            
        view.poolPicker.delegate = self
        view.poolPicker.dataSource = self
               
    }
        
        
    /// Dismisses the picker and fills the text field
    @objc func dismissPicker(view: UIView, viewModel: Int) {
            
        // Shortens the selected option and fills the text field, supports up to 8 Pools total
        if (view.selectPoolTextField.isEditing) {
            let selectedRow : Int = view.poolPicker.selectedRow(inComponent: 0)
            
            if (
            // Update the chosen pool
         //   leagueOverviewViewModel.poolNumber = selectedRow
                
            switch selectedRow {
                case 0:
                    view.selectPoolTextField.text = "Pool A"
                case 1:
                    view.selectPoolTextField.text = "Pool B"
                case 2:
                    view.selectPoolTextField.text = "Pool C"
                case 3:
                    view.selectPoolTextField.text = "Pool D"
                case 4:
                    view.selectPoolTextField.text = "Pool E"
                case 5:
                    view.selectPoolTextField.text = "Pool F"
                case 6:
                    view.selectPoolTextField.text = "Pool G"
                case 7:
                    view.selectPoolTextField.text = "Pool H"
                default:
                    print("Error filling size of lawn text field")
                    
            }
                
            view.tableView.reloadData()

        }
        // Hide the picker
        view.endEditing(true)
    }

}
*/
