//
//  HabitViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

var habit = "drinkWater"

class HabitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        addHabitDay(habit: habit)
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
    
    
    private func addHabitDay(habit:String) {
        let db = Firestore.firestore()
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            let userEmail = user?.email
           
            let docRef = db.collection("users").document(userEmail!).collection("habits").document(habit).collection("habitDays").document("init")
            
            var day = 0
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    day = document.data()!["day"]! as! Int
                    //print("Day of habit: \(day)")
                    //print(day)
                    docRef.updateData([
                        "day": (day + 1)
                    ])
                    db.collection("users").document(userEmail!).collection("habits").document(habit).collection("habitDays").document(String(day+1)).setData(["date": FirebaseFirestore.Timestamp.init(), "day": (day + 1)])
                } else {
                    print("Document does not exist")
                }
            }
            
            
            
            //day = db.collection("users").document(userEmail!).collection("habits").document(habit).collection("habitDays").document("init").
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
    }
}
