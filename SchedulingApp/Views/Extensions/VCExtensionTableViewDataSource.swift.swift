//
//  VCExtensionTableViewDataSource.swift.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation
import UIKit
 
// MARK: - UITableView Data Source
 
extension LeagueOverviewVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueOverviewViewModel.sizeOfPool()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Initializes cell by referencing the identifier set in the Interface Builder
        guard let cell = tableView.dequeueReusableCell(withIdentifier: keyReuseIdentifier, for: indexPath) as? LeagueOverviewTableViewCell
            else {
                fatalError("Bad cell: Could not cast")
        }
        
       // print("\(self.leagueOverviewViewModel.displayTeamNames()[1].teamName)")
        cell.delegate = self

        cell.teamName.text = "\(self.leagueOverviewViewModel.displayTeamNames()[indexPath.row].teamName)"
        
        return cell
    }
    
}

extension TeamInfoVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the amount of games on their schedule
        // return Team.schedule.count
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Initializes cell by referencing the identifier set in the Interface Builder
        guard let cell = tableView.dequeueReusableCell(withIdentifier: keyReuseIdentifier, for: indexPath) as? TeamInfoTableViewCell
            else {
                fatalError("Bad cell: Could not cast")
        }
        
        cell.dateLabel.text = teamInfoViewModel?.gameDateArray[indexPath.row]
        cell.opponentLabel.text = teamInfoViewModel?.opponentsArray?[indexPath.row]
        
        return cell
    }
    
}


extension LeagueScheduleVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the amount of games on their schedule
        // return Team.schedule.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Initializes cell by referencing the identifier set in the Interface Builder
        guard let cell = tableView.dequeueReusableCell(withIdentifier: keyReuseIdentifier, for: indexPath) as? LeagueScheduleTableViewCell
            else {
                fatalError("Bad cell: Could not cast")
        }
        
        cell.dateLabel.text = Constants.DAILY_SCHEDULE[indexPath.row]
        
        cell.matchupLabel.text = leagueScheduleViewModel!.formatMatchupData(timeSlot: indexPath.row)
       // print("\(self.leagueOverviewViewModel.displayTeamNames()[1].teamName)")
       // cell.delegate = self

      //  cell.teamName.text = "\(self.leagueOverviewViewModel.displayTeamNames()[indexPath.row].teamName)"
      
        return cell
    }
    
}
