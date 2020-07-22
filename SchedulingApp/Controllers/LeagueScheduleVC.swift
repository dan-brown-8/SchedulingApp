//
//  LeagueScheduleVC.swift
//  SchedulingApp
//
//  Created by Dan Brown on 7/20/20.
//  Copyright © 2020 Dan Brown. All rights reserved.
//

import UIKit

class LeagueScheduleVC: UIViewController {

    var leagueScheduleViewModel: LeagueScheduleViewModel?

    @IBOutlet var leagueScheduleView: LeagueScheduleView!
    
    let keyReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Conform to the table view delegate
        leagueScheduleView.tableView.delegate = self
        leagueScheduleView.tableView.dataSource = self
    }

    @IBAction func previousWeekPressed(_ sender: Any) {
        if (leagueScheduleViewModel?.week == 1) {
            print("Do nothing")
        }
        else if (leagueScheduleViewModel?.week == 2) {
            leagueScheduleView.previousWeekButton.isHidden = true
            
            self.alterButtons(weekArray: leagueScheduleViewModel!.adjustButtons(adjustment: -1))
            leagueScheduleView.tableView.reloadData()
        }
        else {
            self.alterButtons(weekArray: leagueScheduleViewModel!.adjustButtons(adjustment: -1))
            leagueScheduleView.tableView.reloadData()
        }
         //   leagueScheduleViewModel.
                // leagueScheduleView.
            
    }
    
    @IBAction func nextWeekPressed(_ sender: Any) {
        
        leagueScheduleView.previousWeekButton.isHidden = false
        
        self.alterButtons(weekArray: leagueScheduleViewModel!.adjustButtons(adjustment: 1))
        
        //leagueScheduleView.tableView.cell.matchupLabel.text = leagueScheduleViewModel!.formatMatchupData(timeSlot: 1)
        leagueScheduleView.tableView.reloadData()
    }
        
    public func alterButtons(weekArray: [String]) {
        self.leagueScheduleView.previousWeekButton.setTitle(weekArray[0], for: .normal)
        self.leagueScheduleView.currentWeekLabel.text = weekArray[1]
        self.leagueScheduleView.nextWeekButton.setTitle(weekArray[2], for: .normal)
    }
    
}

