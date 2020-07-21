//
//  LeagueOverviewViewModel.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

/*var leagueOverviewViewModel: LeagueOverviewViewModel = LeagueOverviewViewModel(
    [MessierViewModel(messierDataModel: Messier1),
     MessierViewModel(messierDataModel: Messier8),
     MessierViewModel(messierDataModel: Messier57)] */
import Foundation

//var leagueOverviewViewModel: [LeagueOverviewViewModel] = [leagueOverviewViewModel(leagueOverviewDataModel: Messier1)]

class LeagueOverviewViewModel {
    
    private let leagueOverviewDataModel: LeagueOverviewDataModel = LeagueOverviewDataModel()
    
    // Am i using this?
    private var pool: [Team]?
    
    /// The pool that was chosen by the user through the pickerview
    var poolNumber : Int?
    var poolName : String?
    
    var teamInfo : Team?
        
    /// The pool data that corresponds to the user selected pool
 //   var selectedPoolData : [Team]?
        
/*    init() {
        totalTeams = 0
        totalPools = 0
        leagueOverview = []
    } */
    
 //   private var totalTeams : Int
  //  private var totalPools : Int
  //  private var leagueOverview : [Pool]

   /* init(leagueOverviewDataModel: LeagueOverviewDataModel)
    {
        self.leagueOverviewDataModel = leagueOverviewDataModel
    } */
    
    
    
 /*   public var league: League {
        return League(numOfTeams: 8, numOfPools: 4, overview: leagueOverviewDataModel.createLeague())
    }
    
    public var leagueOverview: [Pool] {
        return leagueOverviewDataModel.createLeague()
    } */
    
    /// Called to create the initial league before any user changes
    public func createTheLeague() -> [Pool]{
        return self.leagueOverviewDataModel.createLeague()
    }
    
    /// Returns the size of the pool that was selected by the user
    public func sizeOfPool() -> Int{
        let league = self.leagueOverviewDataModel.getLeagueOverview
      //  print("\(league()[self.poolNumber].numOfTeams)")
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

}
