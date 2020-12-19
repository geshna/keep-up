//
//  HabitViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit


class HabitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    //var myHabits = [] as [String]
    var myHabits = ["drink water", "eat veggies", "run", "yoga"]
    //var myDays = [] as [String]
    var myDays = ["M, W", "S, M, W, Th, F, Sat", "M, W, F", "Th"]
    //var myStreaks = [] as [Int]
    var myStreaks = [4, 2, 4, 23]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myHabits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTableViewCell", for: indexPath) as! HabitTableViewCell
        
        cell.habitName.text = myHabits[indexPath.row]
        cell.daysOfWeek.text = myDays[indexPath.row]
        cell.myStreak.text = "My Streak:" + String(myStreaks[indexPath.row])
        
        return cell
    }
    
    @IBAction func unwindtoHabits(_ sender: UIStoryboardSegue) {}
}
