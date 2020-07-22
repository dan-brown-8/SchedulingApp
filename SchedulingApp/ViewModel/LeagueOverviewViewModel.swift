//
//  LeagueOverviewViewModel.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

protocol PassModelToNextViewModelDelegate : class {
    func receiveModel(dataModel: LeagueOverviewDataModel)
}

class LeagueOverviewViewModel {
    
    private let leagueOverviewDataModel: LeagueOverviewDataModel = LeagueOverviewDataModel()
    
    /// The pool that was chosen by the user through the pickerview
    var poolNumber : Int?
    var poolName : String?
    
    var teamInfo : Team?
        
    weak var delegate : PassModelToNextViewModelDelegate?

    /// Called to create the initial league before any user changes
    public func createTheLeague() {
        self.leagueOverviewDataModel.createLeague()
    }
    
    /// Returns the size of the pool that was selected by the user
    public func sizeOfPool() -> Int{
        let league = self.leagueOverviewDataModel.getLeagueOverview

        if self.poolNumber != nil  {
         //   print("Populate")
            return league()[self.poolNumber!].numOfTeams
        }
        else {
            return 0
        }
    }
    
    /// Returns the teams that are to be displayed in the table
    public func displayTeamNames() -> [Team] {
        let league = leagueOverviewDataModel.getLeagueOverview()
        return league[poolNumber!].teams
    }
    
    /// Once the details button is pressed, grab the corresponding team's data and prepare to segue to the team info view
    public func teamDetails(index: Int) {
        let league = self.leagueOverviewDataModel.getLeagueOverview
        self.teamInfo = league()[self.poolNumber!].teams[index]
    }
    
    /// Initialize team info viewModel
    public func initializeNewViewModel() {
        self.delegate?.receiveModel(dataModel: leagueOverviewDataModel)
    }

}
