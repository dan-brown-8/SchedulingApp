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
        
    // Initialize our data model so it can be used in this viewModel
   /* init(leagueOverviewDataModel: LeagueOverviewDataModel) {
        self.leagueOverviewDataModel = leagueOverviewDataModel
    }*/
  /*  func displayTeamName() -> String {
        return teamInfo!.teamName
    }
    
    func displayPoolName() -> String {
        return poolName ?? ""
    } */
    
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
