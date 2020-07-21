//
//  LeagueScheduleTableViewCell.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//


import UIKit

/// This class controls the objects that are configured into an individual cell on the table
class LeagueScheduleTableViewCell : UITableViewCell {
    
    @IBOutlet weak var matchupLabel: UILabel!
    @IBOutlet weak var dateLebel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // FormatButton.makeRound(button: detailsButton, cornerRadius: 10)
       // Borders.createThinBorders(buttonName: detailsButton)

    }

}
