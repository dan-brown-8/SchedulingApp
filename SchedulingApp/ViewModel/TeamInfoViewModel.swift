//
//  TeamInfoViewModel.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

//var leagueOverviewViewModel: [LeagueOverviewViewModel] = [leagueOverviewViewModel(leagueOverviewDataModel: Messier1)]

class TeamInfoViewModel {
    
    private let leagueOverviewDataModel: LeagueOverviewDataModel = LeagueOverviewDataModel()
    
    var teamInfo: Team?
    
    /// The pool that was chosen by the user through the pickerview
    var poolNumber : Int?
    var poolName : String?
        
}
