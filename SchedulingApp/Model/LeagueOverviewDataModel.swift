//
//  Model.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/19/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

let teamsPerPool = 8
let gamesPerTeam = 8
let totalPools = 4

class LeagueOverviewDataModel {

    init() {
        totalTeams = 0
        totalPools = 0
        leagueOverview = []
        schedule = []
    }
       
    private var totalTeams : Int
    private var totalPools : Int
    private var leagueOverview : [Pool]
    private var schedule : [Game]
    
    public func setTotalTeams(totalTeams : Int) {
        self.totalTeams = totalTeams
    }
    
    public func setTotalPools(totalPools : Int) {
        self.totalPools = totalPools
    }
    
    public func setLeagueOverview(leagueOverview : [Pool]) {
        self.leagueOverview = leagueOverview
    }
    
    public func setSchedule(schedule : [Game]) {
        self.schedule = schedule
    }
    
    public func getTotalTeams() -> Int {
        return totalTeams
    }
       
    public func getTotalPools() -> Int {
        return totalPools
    }
    
    public func getLeagueOverview() -> [Pool] {
        return leagueOverview
    }
    
    public func getSchedule() -> [Game] {
        return schedule
    }
    
    
    
    // CREATE LEAGUE FUNCTIONS
    
    /// Used to create the initial league upon startup
    public func createLeague() {
        let leagueOverview = [createPools(poolNumber: 1), createPools(poolNumber: 2),
        createPools(poolNumber: 3), createPools(poolNumber: 4)]
        
        self.setLeagueOverview(leagueOverview: leagueOverview)
        self.setTotalPools(totalPools: totalPools)
        self.setTotalTeams(totalTeams: totalPools * teamsPerPool)
        
        self.scheduleGenerator()
    }
    
    /// Used to create the initial pools upon startup
    public func createPools(poolNumber: Int) -> Pool {
        
        var teams : [Team] = []
        var poolName : String?
        
        // Create the default team values for each pool depending on the pool number
        switch poolNumber {
        case 1:
            for n in 1...teamsPerPool {
                teams.append(createTeams(teamNumber: n))
                poolName = "Pool A"
            }
        case 2:
            for n in (teamsPerPool+1)...(teamsPerPool*2) {
                teams.append(createTeams(teamNumber: n))
                poolName = "Pool B"
            }
        case 3:
            for n in ((teamsPerPool*2)+1)...(teamsPerPool*3) {
                teams.append(createTeams(teamNumber: n))
                poolName = "Pool C"
            }
        case 4:
            for n in ((teamsPerPool*3)+1)...(teamsPerPool*4) {
                teams.append(createTeams(teamNumber: n))
                poolName = "Pool D"
            }
        default:
            break
        }
        
        return Pool(numOfTeams: teamsPerPool, poolName: poolName!, teams: teams)
    }
    
    public func createTeams(teamNumber: Int) -> Team {
        return Team(teamName: "Team" + "\(teamNumber)", numOfGames: gamesPerTeam)
    }
    
    public func updateTeamName(oldName: String, newName: String, poolNumber: Int) {
       // print(self.getLeagueOverview())
        var league = self.getLeagueOverview()
        var pool = league[poolNumber]

        // Find the team in the pool and set it's new name
        for (index, team) in pool.teams.enumerated() {
            if (team.teamName == oldName) {
                pool.teams[index].teamName = newName
            }
        }
        
        // Update the league to register the name change
        league[poolNumber] = pool
        setLeagueOverview(leagueOverview : league)
        
        var schedule = self.getSchedule()
        
        // Find the team in the schedule and set it's new name
        for (index, game) in schedule.enumerated() {
            if (game.team1.teamName == oldName) {
                print("\(game.team1.teamName)")
                print(index)
                schedule[index].team1.teamName = newName
            }
            if (game.team2.teamName == oldName) {
                print("\(game.team2.teamName)")
                print(index)
                schedule[index].team2.teamName = newName
            }
        }
        
        self.setSchedule(schedule: schedule)
         
    }
    
    public func updatePools(oldPoolNumber: Int, newPoolNumber: Int, teamName: String) {
        print("Update the Pools")
        
        var league = self.getLeagueOverview()
        var oldPool = league[oldPoolNumber]
        var newPool = league[newPoolNumber]
        
        
        // Find the team in the pool
        for (index, team) in oldPool.teams.enumerated() {
            if (team.teamName == teamName) {
                // Append the team to it's new pool
                newPool.teams.append(team)
                newPool.numOfTeams += 1
                // Remove the team from it's old pool
                oldPool.teams.remove(at: index)
                oldPool.numOfTeams -= 1
                
            }
        }
        // Update the league to register the name change
        league[oldPoolNumber] = oldPool
        league[newPoolNumber] = newPool
        setLeagueOverview(leagueOverview : league)
    }
    
    /// Use this function to add additional pools to the league
  /*  public func addPool(numOfTeams: Int, poolName: String, teams: [Team]) {
           
    }
    
    /// Use this function to add additional teams to the league
    public func addTeam(numOfTeams: Int, poolName: String, teams: [Team]) {
           
    } */
    
 /*   /// Potentially available in future updates
    public removePools() {
    }
    
    
        /// Potentially available in future updates
    public func removeTeam() {
               
    } */
    
    public func scheduleGenerator() {
        var schedule : [Game] = []
        
        var league = getLeagueOverview()

        var teamNum = 0

        var team1 : Team?
        var team2 : Team?
        
         // Schedule a team to play everyone in their pool, then remove them. Repeat the process for every team in their pool, then repeat the process with the remaining pools
        for poolNum in 0...league.count - 1 {

            while (league[poolNum].teams.count > 0) {
        
                for (index, team) in league[poolNum].teams.enumerated() {
                    // Once the team has played everyone else in their pool, pop them from the stack
                    if ((index + 1) == league[poolNum].teams.count) {
                        league[poolNum].teams.remove(at: teamNum)
                        break
                    }
                    else {
                        team1 = league[poolNum].teams[teamNum]
                        team2 = league[poolNum].teams[teamNum + 1 + index]
                
                        schedule.append(Game(team1: team1!, team2: team2!))
                    }
                }
        
            }
        }
        
        // Replenish the league value so we can access the teams again
        league = getLeagueOverview()
        
        while (league.count > 1) {
            // Select a random pool, then remove from the sta so we don't select it again as a duplicate
            var randomNumber = Int.random(in: 0 ..< league.count)
            var pool1 = league[randomNumber]
            league.remove(at: randomNumber)
        
        
            randomNumber = Int.random(in: 0 ..< league.count)
            var pool2 = league[randomNumber]
            league.remove(at: randomNumber)
        
            // Match a team from 1 pool to a random team from the other pool. Remove the random team so they are not selected again as a duplicate
            for i in 0...pool1.teams.count - 1 {
                team1 = pool1.teams[i]
            
                randomNumber = Int.random(in: 0 ..< pool2.teams.count)
                team2 = pool2.teams[randomNumber]
                schedule.append(Game(team1: team1!, team2: team2!))
                pool2.teams.remove(at: randomNumber)
            }
        }
        
        /// Randomize the games on the schedule
        schedule = schedule.shuffled()
        
        self.setSchedule(schedule : schedule)
        
    }
    
    public func createTeamSchedule(teamName: String) -> [Any] {
        var teamScheduleData : [Any] = [Any]()
        
        // Find the team in the schedule and create their individual schedule
        for (index, game) in schedule.enumerated() {
            if (game.team1.teamName == teamName) {
                teamScheduleData.append(index)
                teamScheduleData.append(game.team2.teamName)
            }
            if (game.team2.teamName == teamName) {
                teamScheduleData.append(index)
                teamScheduleData.append(game.team1.teamName)
            }
        }
        return teamScheduleData
    }
    
}
    
    
    
    
struct Team {
    var teamName: String
    var numOfGames: Int
}

struct Pool {
    var numOfTeams: Int
    var poolName: String
    var teams: [Team]
}

struct League {
    var numOfTeams: Int
    var numOfPools: Int
    var overview: [Pool]
    
    init(numOfTeams: Int, numOfPools: Int, overview: [Pool]) {
        self.numOfTeams = numOfTeams
        self.numOfPools = numOfPools
        self.overview = overview
    }
}

struct Game {
    var team1: Team
    var team2: Team
    // let weekNumber: Int
 /*  Available in more advanced versions
     let Date : Date
     let gamePlayed: Bool
     let team1Score: Int
     let team2Score: Int
 */
}

/*struct Week {
    let weekNumber: Int
    let games: [Game]
    
  //  let Date : Date
} */

struct Schedule {
    var games: [Game]
    
    init(games: [Game]) {
        self.games = games
    }

}
