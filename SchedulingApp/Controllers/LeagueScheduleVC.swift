//
//  LeagueScheduleVC.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class LeagueScheduleVC: UIViewController {

    @IBOutlet var leagueScheduleView: LeagueScheduleView!
    
    let keyReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Conform to the table view delegate
        leagueScheduleView.tableView.delegate = self
        leagueScheduleView.tableView.dataSource = self
    }


}

