//
//  TeamInfoViewModel.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

//var leagueOverviewViewModel: [LeagueOverviewViewModel] = [leagueOverviewViewModel(leagueOverviewDataModel: Messier1)]

class TeamInfoViewModel: PassModelToNextViewModelDelegate {
    
    private var leagueOverviewDataModel: LeagueOverviewDataModel?
    
    var leagueOverviewViewModel: LeagueOverviewViewModel?
    
    var teamInfo: Team?
    
    /// The pool that was chosen by the user through the pickerview
    var poolNumber : Int?
    var poolName : String?
    
    var originalPoolNumber : Int?
    
    /// Holds all of the game dates from the team schedule
    var gameDateArray : [String] = [String]()
    /// Holds all of the opponents from the team schedule
    var opponentsArray : [String]?
    
    func generateTeamSchedule() {
        let dataArray = leagueOverviewDataModel!.createTeamSchedule(teamName: teamInfo!.teamName)
        
        // Grab all even values from the array
        let datesArray = stride(from: 0, to: dataArray.count, by: 2).map { dataArray[$0] }
        
        // Grab all odd values from the array
        self.opponentsArray = (stride(from: 1, to: dataArray.count, by: 2).map { dataArray[$0] }) as? [String]
                
        convertDateValueToString(datesArray: datesArray as! [Int])
    }
    
    /// Converts the numeric date value to a value that we can use to display to the user
    func convertDateValueToString(datesArray: [Int]) {
        
        for n in 0...datesArray.count - 1 {
            let dateNum = datesArray[n]
            let week = Int(dateNum / 5)
            let timeslotNum = dateNum % 5
            
            let timeslotString = convertTimeslotNumberToString(timeslot: timeslotNum)
            
            self.gameDateArray.append("Week " + "\(week+1), " + timeslotString)
          //  print(self.gameDateArray)

        }

    }
    
    /// Converts the timeslot number to a string that we can display to the user
    func convertTimeslotNumberToString(timeslot: Int) -> String {
        
        switch timeslot {
            case 0:
                return "Day 1, Game 1"
            case 1:
                return "Day 1, Game 2"
            case 2:
                return "Day 1, Game 3"
            case 3:
                return "Day 2, Game 4"
            case 4:
                return "Day 2, Game 5"
            default:
                return ""
        }
    }
    
    func changeTeamName(newName: String) {
        leagueOverviewDataModel!.updateTeamName(oldName: teamInfo!.teamName, newName: newName, poolNumber: self.poolNumber!)
    }
    
    func changePool() {
        leagueOverviewDataModel!.updatePools(oldPoolNumber: self.originalPoolNumber!, newPoolNumber: self.poolNumber!, teamName: self.teamInfo!.teamName)
    }
    
    /// Delegate used to receive the data model from the previous view model
    func receiveModel(dataModel: LeagueOverviewDataModel) {
        leagueOverviewDataModel = dataModel
    }
    
}
