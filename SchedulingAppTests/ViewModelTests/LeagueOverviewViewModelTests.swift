//
//  LeagueOverviewViewModelTests.swift
//  SchedulingAppTests
//
//  Created by Dan Brown on 7/22/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import XCTest
@testable import SchedulingApp

class LeagueOverviewViewModelTests: XCTestCase {

    let leagueOverviewViewModel : LeagueOverviewViewModel = LeagueOverviewViewModel()
    let leagueOverviewDataModel: LeagueOverviewDataModel = LeagueOverviewDataModel()
    
    public func testCreateTheLeague() {
        leagueOverviewViewModel.createTheLeague()
        
        leagueOverviewViewModel.poolNumber = 2
        // Each pool should have 8 teams
        XCTAssertEqual(leagueOverviewViewModel.sizeOfPool(), 8)
        
    }
    
    public func testSizeOfPool() {
        leagueOverviewViewModel.createTheLeague()
        
        leagueOverviewViewModel.poolNumber = 3
        // Each pool should have 8 teams
        XCTAssertNotEqual(leagueOverviewViewModel.sizeOfPool(), 6)
        
    }
    
    public func testDisplayTeamNames() {
        leagueOverviewViewModel.createTheLeague()
        
        leagueOverviewViewModel.poolNumber = 0
        
        XCTAssertEqual(leagueOverviewViewModel.displayTeamNames().count, 8)
        XCTAssertEqual(leagueOverviewViewModel.displayTeamNames().first?.teamName, "Team1")
        
        leagueOverviewViewModel.poolNumber = 3
        
        XCTAssertEqual(leagueOverviewViewModel.displayTeamNames().last?.teamName, "Team32")

    }
    
    public func testTeamDetails() {
        leagueOverviewViewModel.createTheLeague()
        leagueOverviewViewModel.poolNumber = 2
        
        leagueOverviewViewModel.teamDetails(index: 4)
                
        XCTAssertEqual(leagueOverviewViewModel.teamInfo?.teamName, "Team21")
        XCTAssertNotEqual(leagueOverviewViewModel.teamInfo?.teamName, "Team2")

    }


}
