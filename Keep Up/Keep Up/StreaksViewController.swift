//
//  StreaksViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit

class StreaksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.init(red: 253/255, green: 247/255, blue: 231/255, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    var friendNames = ["Carl", "Jamie", "Tom", "Jose", "Tiff"]
    //var myDays = [] as [String]
    var friendHabits = ["Yoga", "Meditation", "Exercise", "Reading", "Sleeping"]
    //var myStreaks = [] as [Int]
    var friendStreaks = [4, 2, 4, 23, 44]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //maybe error if multiple habits w/ one friend or multiple friends with one habit dep on how the data is queried
        return friendHabits.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StreaksTableViewCell", for: indexPath) as! StreaksTableViewCell
        
        cell.friendName.text = friendNames[indexPath.row]
        cell.habitName.text = friendHabits[indexPath.row]
        cell.friendStreak.text = "Our Streak: " + String(friendStreaks[indexPath.row])
        
        return cell
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
