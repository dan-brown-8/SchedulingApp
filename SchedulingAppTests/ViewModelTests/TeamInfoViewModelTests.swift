//
//  TeamInfoViewModelTests.swift
//  SchedulingAppTests
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import XCTest
@testable import SchedulingApp

class TeamInfoViewModelTests: XCTestCase {

    let teamInfoViewModel : TeamInfoViewModel = TeamInfoViewModel()
    let leagueOverviewDataModel: LeagueOverviewDataModel = LeagueOverviewDataModel()
    
    public func testChangeTeamName() {
        // Create the necessary data models so we can test
        setPreliminaryValues()
        
        // Our original Team name
        teamInfoViewModel.teamInfo = Team(teamName: "Team5", numOfGames: 8)
        teamInfoViewModel.poolNumber = 0
        teamInfoViewModel.changeTeamName(newName: "Pirates") // new name
        
        // Did the team's name successfully change inside the schedule?
        let scheduleAfterNameChange = leagueOverviewDataModel.getSchedule()
        XCTAssertEqual(scheduleAfterNameChange[0].team1.teamName, "Pirates")
        XCTAssertNotEqual(scheduleAfterNameChange[0].team1.teamName, "Team5")
        
        
        // Did the team's name successfully change inside the league?
        let leagueAfterNameChange = leagueOverviewDataModel.getLeagueOverview()
        print(leagueAfterNameChange)
        XCTAssertEqual(leagueAfterNameChange[0].teams[4].teamName, "Pirates")
        
    }
    
    public func testChangePool() {
        // Create the necessary data models so we can test
        setPreliminaryValues()
        
        // Our original pool
        teamInfoViewModel.teamInfo = Team(teamName: "Team1", numOfGames: 8)
        teamInfoViewModel.originalPoolNumber = 0
        teamInfoViewModel.poolNumber = 1
        
        teamInfoViewModel.changePool()
        
        // Did the team's pool successfully change inside the league?
        let leagueAfterPoolChange = leagueOverviewDataModel.getLeagueOverview()
        print(leagueAfterPoolChange)
        // Team 1 is no longer in Pool 0
        XCTAssertNotEqual(leagueAfterPoolChange[0].teams[0].teamName, "Team1")
        // Pool 1 is now 1 team larger
        XCTAssertEqual(leagueAfterPoolChange[1].teams.count, 9)
        
    }
    
    // Converts date value to a string that can be presented
    public func testConvertDateValueToString() {
        teamInfoViewModel.convertDateValueToString(datesArray: [10, 17, 25])
        
        XCTAssertEqual(teamInfoViewModel.gameDateArray[0], "Week 3, Day 1, Game 1")
    }
    
    public func testConvertTimeslotNumberToString() {
        // Team that the conversion is accurate
        XCTAssertEqual(teamInfoViewModel.convertTimeslotNumberToString(timeslot: 4), "Day 2, Game 5")
        XCTAssertEqual(teamInfoViewModel.convertTimeslotNumberToString(timeslot: 1), "Day 1, Game 2")
        
    }
    
    public func testGenerateTeamSchedule() {
        setPreliminaryValues()
        teamInfoViewModel.teamInfo = Team(teamName: "Team1", numOfGames: 8)
        
        teamInfoViewModel.generateTeamSchedule()
        
        XCTAssertNotEqual(teamInfoViewModel.opponentsArray?.count, 7)
    }
    
    public func setPreliminaryValues() {
        // Test the creation of a schedule
        leagueOverviewDataModel.setSchedule(schedule: [Game(team1: Team(teamName: "Team5", numOfGames: 8), team2: Team(teamName: "Team2", numOfGames: 8)),
                                                        Game(team1: Team(teamName: "Team4", numOfGames: 8), team2: Team(teamName: "Team1", numOfGames: 8))])
        
        // Test the creation of a couple pools
        let pool1 = leagueOverviewDataModel.createPools(poolNumber: 1)
        let pool2 = leagueOverviewDataModel.createPools(poolNumber: 2)

        // Test the creation of a league
        leagueOverviewDataModel.setLeagueOverview(leagueOverview : [pool1, pool2])
        
        // Test the delegate that passes the data model
        teamInfoViewModel.receiveModel(dataModel: leagueOverviewDataModel)

    }


}
