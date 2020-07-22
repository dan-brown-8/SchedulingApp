//
//  LeagueOverviewTableViewCell.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

protocol LeagueOverviewCellDelegate: class {
    func detailsButtonTapped(cell: LeagueOverviewTableViewCell)
}
/// This class controls the objects that are configured into an individual cell on the table
class LeagueOverviewTableViewCell : UITableViewCell {
    
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var teamName: UILabel!
    
    weak var delegate: LeagueOverviewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = nil
        
        FormatButton.makeRound(button: detailsButton, cornerRadius: 5)
        Borders.createThinBorders(buttonName: detailsButton)

    }
    
    // When the 'details' button is selected
    @IBAction func detailsButtonTapped(_ sender: UIButton) {
        print("Details Button Tapped")
        self.delegate?.detailsButtonTapped(cell: self)
    
    }
    
    /// Sets the selected state of the cell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
