//
//  LeagueScheduleViewModel.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation


class LeagueScheduleViewModel: PassModelToNextViewModelDelegate {
    
    private var leagueOverviewDataModel: LeagueOverviewDataModel?
    
    var leagueOverviewViewModel: LeagueOverviewViewModel?

    var week = 1

    /// Gathers and formats the matchup data to be shown on the schedule
    func formatMatchupData(timeSlot: Int) -> String {
        /// Calculate the game number
        let gameNumber = ((week - 1) * 5) + timeSlot
        
        if (gameNumber > 127) {
            return ""
        }
        
        let schedule = leagueOverviewDataModel?.getSchedule()
        let team1 = schedule![gameNumber].team1.teamName
        let team2 = schedule![gameNumber].team2.teamName
        
        print("\(team1 + " v " + team2)")
        
        return "\(team1 + " v " + team2)"
        
    }
    
    
    /// Delegate used to receive the data model from the previous view model
    func receiveModel(dataModel: LeagueOverviewDataModel) {
        leagueOverviewDataModel = dataModel
    }
    
    /// Called when a 'week' button is pressed
    func adjustButtons(adjustment: Int) -> [String] {
        self.week = self.week + adjustment
        return ["Week " + "\(self.week - 1)", "Week " + "\(self.week)", "Week " + "\(self.week + 1)"]
    }
}
