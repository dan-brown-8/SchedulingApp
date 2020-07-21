//
//  VCExtensionTableViewCellDelegate.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

extension LeagueOverviewVC : LeagueOverviewCellDelegate {
    func detailsButtonTapped(cell: LeagueOverviewTableViewCell) {
        
        guard let indexPath = leagueOverviewView.tableView.indexPath(for: cell) else {
            // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
            print("ERROR: detailsButtonTapped delegate")
            //jobApplicantsView.stopAnimatingSpinner()
            return
        }
        
        // Prepare the teams details to be passed to the next view
        self.leagueOverviewViewModel.teamDetails(index: indexPath.row)
        
        performSegue(withIdentifier: "toTeamInfo", sender: nil)
        
        print("Button tapped on row \(indexPath.row)")
    }
}
