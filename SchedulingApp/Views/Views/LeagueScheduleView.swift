//
//  LeagueScheduleView.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class LeagueScheduleView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var previousWeekButton: UIButton!
    @IBOutlet weak var nextWeekButton: UIButton!
    @IBOutlet weak var currentWeekLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Hide that button initially
        previousWeekButton.isHidden = true
    }
}
