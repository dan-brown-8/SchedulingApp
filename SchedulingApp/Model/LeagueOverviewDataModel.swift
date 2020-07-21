//
//  Model.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/19/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

/*init() {
   // game = Game(team1: team, team2: team, timeSlot: 0, weekNumber: 0))
  //  team = Team(teamName: "", numOfGames: 0, schedule: Schedule(games: [game]))
  //  pool = Pool(numOfTeams: 0, poolName: "", teams: [Team])
    league = League(numOfTeams: 0, numOfPools: 0, overview: [Pool(numOfTeams: 0, poolName: "", teams: [])])
    schedule = Schedule(games: [])
}

private var league : League
private var schedule : Schedule */

class LeagueOverviewDataModel {

    init() {
           totalTeams = 0
           totalPools = 0
           leagueOverview = []
       }
       
       private var totalTeams : Int
       private var totalPools : Int
       private var leagueOverview : [Pool]
    
    public func setTotalTeams(totalTeams : Int) {
        self.totalTeams = totalTeams
    }
    
    public func setTotalPools(totalPools : Int) {
        self.totalPools = totalPools
    }
    
    public func setLeagueOverview(leagueOverview : [Pool]) {
        self.leagueOverview = leagueOverview
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
    
    
    
    // CREATE LEAGUE FUNCTIONS
    
    /// Used to create the initial league upon startup
    public func createLeague() -> [Pool] {
        let leagueOverview = [createPools(poolNumber: 1), createPools(poolNumber: 2),
        createPools(poolNumber: 3), createPools(poolNumber: 4)]
        
        self.setLeagueOverview(leagueOverview: leagueOverview)
        self.setTotalPools(totalPools: 4)
        self.setTotalTeams(totalTeams: 32)
        
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
    let timeSlot: Int // 5 total timeslots: 3 on saturday 2 on sunday
    let weekNumber: Int
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
