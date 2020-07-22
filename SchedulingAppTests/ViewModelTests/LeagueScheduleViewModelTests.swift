//
//  LeagueScheduleViewModelTests.swift
//  SchedulingAppTests
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import XCTest
@testable import SchedulingApp

class LeagueScheduleViewModelTests: XCTestCase {

    let leagueScheduleViewModel : LeagueScheduleViewModel = LeagueScheduleViewModel()
    let leagueOverviewDataModel: LeagueOverviewDataModel = LeagueOverviewDataModel()
    
    public func testAdjustButton() {
        
        // Tests for adjusting the 'week' buttons based on which ones were pressed
        let testOne = leagueScheduleViewModel.adjustButtons(adjustment: 1)
        let testTwo = leagueScheduleViewModel.adjustButtons(adjustment: -1)
        
        //testOne
        XCTAssertNotEqual(testOne, ["Week 2", "Week 3", "Week 4"])
        XCTAssertEqual(testOne, ["Week 1", "Week 2", "Week 3"])

        //testTwo
        XCTAssertNotEqual(testTwo, ["Week 1", "Week 2", "Week 3"])
        XCTAssertEqual(testTwo, ["Week 0", "Week 1", "Week 2"])
    
        
    }
    
    public func testFormatMatchupData() {
                
        // Test the creation of a schedule
        leagueOverviewDataModel.setSchedule(schedule: [Game(team1: Team(teamName: "TestTeam1", numOfGames: 8), team2: Team(teamName: "TestTeam2", numOfGames: 8)),
                                                        Game(team1: Team(teamName: "TestTeam6", numOfGames: 8), team2: Team(teamName: "TestTeam1", numOfGames: 8))])
        
        // Test the delegate that passes the data model
        leagueScheduleViewModel.receiveModel(dataModel: leagueOverviewDataModel)
       
        XCTAssertNotEqual(leagueScheduleViewModel.formatMatchupData(timeSlot: 1), "TestTeam1 v TestTeam2")
        XCTAssertEqual(leagueScheduleViewModel.formatMatchupData(timeSlot: 1), "TestTeam6 v TestTeam1")
        
    }
}
