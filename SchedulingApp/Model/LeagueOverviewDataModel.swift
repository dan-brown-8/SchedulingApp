//
//  Model.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/19/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

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
    public func createLeague() -> [Pool] {
        let leagueOverview = [createPools(poolNumber: 1), createPools(poolNumber: 2),
        createPools(poolNumber: 3), createPools(poolNumber: 4)]
        
        self.setLeagueOverview(leagueOverview: leagueOverview)
        self.setTotalPools(totalPools: 4)
        self.setTotalTeams(totalTeams: 32)
        
        self.scheduleGenerator()
      //  print("Creating league")
     //   print (self.getLeagueOverview())
        
        return leagueOverview
    }
    
    /// Used to create the initial pools upon startup
    public func createPools(poolNumber: Int) -> Pool {
        
        var teams : [Team] = []
        
        // Create the default team values for each pool depending on the pool number
        switch poolNumber {
        case 1:
            for n in 1...8 {
                teams.append(createTeams(teamNumber: n))
            }
        case 2:
            for n in 9...16 {
                teams.append(createTeams(teamNumber: n))
            }
        case 3:
            for n in 17...24 {
                teams.append(createTeams(teamNumber: n))
            }
        case 4:
            for n in 25...32 {
                teams.append(createTeams(teamNumber: n))
            }
        default:
            break
        }
        
        return Pool(numOfTeams: 8, poolName: "Pool" + "\(poolNumber)", teams: teams)
    }
    
    public func createTeams(teamNumber: Int) -> Team {
        return Team(teamName: "Team" + "\(teamNumber)", numOfGames: 8)
    }
    
    public func updateTeamName(oldName: String, newName: String, poolNumber: Int) {
        print(poolNumber)
       // print(self.getLeagueOverview())
        var league = self.getLeagueOverview()
        var pool = league[poolNumber]

        // Find the team in the pool and set it's new name
        for (index, team) in pool.teams.enumerated() {
            if (team.teamName == oldName) {
                print("\(team.teamName)")
                print("\(pool.teams[index].teamName)")
                print(index)
                pool.teams[index].teamName = newName
            }
        }
        // Update the league to register the name change
        league[poolNumber] = pool
        setLeagueOverview(leagueOverview : league)
        
 //       return true
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
    
   /* public func findTeamInPool(pool: Pool, name: String) {
        
        // Iterate through pool and find team
        for (index, team) in pool.teams.enumerated() {
            if (team.teamName == oldName) {
             //   print("\(team.teamName)")
              //  print("\(pool.teams[index].teamName)")
                print(index)
                pool.teams[index].teamName = newName
            //    team.teamName = newName
              //  index+=1
            }
        }
    } */
    
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
        
       // poolNum : 0 - 3 // Number of pools in the league
       // teamNum : 0 - 6 // Number of teams in a pool

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
        
        print(schedule)
        print(schedule.count)
        
        /// Randomize the games on the schedule
        schedule = schedule.shuffled()
        
        self.setSchedule(schedule : schedule)
        
    }
    
}
    
    
    
    
struct Team {
    var teamName: String
    var numOfGames: Int
   // var schedule: Schedule
 // let schedule: [Games]
 // let poolName: String
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
    
    /// Used to create the initial league upon startup
  /*  public func createLeague() -> League {
        return League(numOfTeams: 32, numOfPools: 4,
                      overview: [createPools(poolNumber: 1), createPools(poolNumber: 2),
                                 createPools(poolNumber: 3), createPools(poolNumber: 4)])
    } */
    
}

struct Game {
    let team1: Team
    let team2: Team
 //   let timeSlot: Int // 5 total timeslots: 3 on saturday 2 on sunday
    //let weekNumber: Int
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
