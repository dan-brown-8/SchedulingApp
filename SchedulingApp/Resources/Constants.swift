//
//  Constants.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/21/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import Foundation

class Options {
    static var POOL_OPTIONS = ["Pool A", "Pool B", "Pool C", "Pool D"]
    
    static let dailySchedule = ["Day 1, Game 1", "Day 1, Game 2", "Day 1, Game 3", "Day 2, Game 1", "Day 2, Game 2"]
}

enum ViewModel : Int {
    case LEAGUE_OVERVIEW_VIEW_MODEL = 0
    case TEAM_INFO_VIEW_MODEL = 1
}


