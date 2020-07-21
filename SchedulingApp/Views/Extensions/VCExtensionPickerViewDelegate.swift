//
//  VCExtensionPickerViewDelegate.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

// MARK: UIPickerViewDelegate
extension LeagueOverviewVC : UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // The # of rows = the amount of options in the picker
        return  Options.POOL_OPTIONS.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Pass the data to the view model
        leagueOverviewViewModel.poolNumber = row
        // Set the title as the text in the corresponding row
        return Options.POOL_OPTIONS[row]

    }
}

extension TeamInfoVC : UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // The # of rows = the amount of options in the picker
        return  Options.POOL_OPTIONS.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Pass the data to the view model
        teamInfoViewModel!.poolNumber = row
        
        // Set the title as the text in the corresponding row
        return Options.POOL_OPTIONS[row]

    }
}
