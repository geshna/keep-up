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
    
    var habitsArray = [[String:Any]]()
    var habitNames = [String]()
    //var habitsID = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 253/255, green: 247/255, blue: 231/255, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        //addHabitDay(habit: habit)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.habitsArray.removeAll()
        self.habitNames.removeAll()
        loadHabits()
    }
    
    //var myHabits = [] as [String]
    var myHabits = ["drink water", "eat veggies", "run", "yoga"]
    //var myDays = [] as [String]
    var myDays = ["M, W", "S, M, W, Th, F, Sat", "M, W, F", "Th"]
    //var myStreaks = [] as [Int]
    var myStreaks = [4, 2, 4, 23]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.habitNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTableViewCell", for: indexPath) as! HabitTableViewCell
        
        //cell.habitName.text = myHabits[indexPath.row]
        cell.habitName.text = self.habitNames[indexPath.row]
        cell.myStreak.text = ""
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //delete
        let delete =  UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in print("delete\(indexPath.row)")
            completionHandler(true)
        }
        
        delete.image = UIImage(systemName: "trash.fill")
        let deleteRed = UIColor(red:204/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0)
        delete.backgroundColor = deleteRed
        
        //swipe actions
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //pin
        let done =  UIContextualAction(style: .normal, title: "Done") { (action, view, completionHandler) in print("done\(indexPath.row + 1)")
            completionHandler(true)
        }
        addHabitDay(habit: habitNames[indexPath.row])
        print("add habit day: \(habitNames[indexPath.row])")
        
        done.image = UIImage(systemName: "checkmark.square.fill")
        let doneGreen = UIColor(red:102/255.0, green: 204/255.0, blue: 143/255.0, alpha: 1.0)
        done.backgroundColor = doneGreen
        
        //swipe actions
        let swipe = UISwipeActionsConfiguration(actions: [done])
        return swipe
    }

    
    @IBAction func unwindtoHabits(_ sender: UIStoryboardSegue) {}
    
    func loadHabits() {
        let db = Firestore.firestore()
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            //let uid = user?.uid
            let userEmail = user?.email
            
            let habitsRef = db.collection("users").document(userEmail!).collection("habits")
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents{
                            print("\(document.documentID) => \(document.data())")
                            self.habitsArray.append(document.data())
                            self.habitNames.append(document.documentID)
                        }
                    }
                    print("habits ID ==> \(self.habitNames)")
                    print("habits array ==> \(self.habitsArray)")
                    self.tableView.reloadData()
                }
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
        print("friends array count: \(self.habitsArray.count)")
        
    }
    
    private func addHabitDay(habit:String) {
        let db = Firestore.firestore()
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            let userEmail = user?.email
           
            let docRef = db.collection("users").document(userEmail!).collection("habits").document(habit).collection("habitDays").document("init")
            
            var day = 0
            var users = ["hi"]
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    day = document.data()!["day"]! as! Int
                    //print("Day of habit: \(day)")
                    //print(day)
                    docRef.updateData([
                        "day": (day + 1)
                    ])
                    db.collection("users").document(userEmail!).collection("habits").document(habit).collection("habitDays").document(String(day+1)).setData(["date": FirebaseFirestore.Timestamp.init(), "day": (day + 1)])
                    
                    // update Streaks
                    
                    db.collection("streaks").whereField("users", arrayContains: userEmail!)
                        .getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                // for each streak:
                                for document in querySnapshot!.documents {
                                    print("\(document.documentID) => \(document.data())")
                                    
                                    // update startTime only if streak is broken
                                    let user0Time = (document.data()["user0_time"]! as AnyObject).dateValue()
                                    let user1Time = (document.data()["user1_time"]! as AnyObject).dateValue()
                                    let now = Date()
                                    var broken = false
                                    let difference0 = now.timeIntervalSince(user0Time)
                                    let difference1 = now.timeIntervalSince(user1Time)
                                    if difference0 > 86400 {
                                        broken = true
                                    }
                                    if (difference1 > 86400) {
                                        broken = true
                                    }
                                    if broken {
                                        db.collection("streaks").document(document.documentID).updateData(["startTime": FirebaseFirestore.Timestamp.init()])
                                    }
                                    
                                    // update your time in the streak
                                    users = document.data()["users"]! as! Array
                                    if (users[0] == userEmail!) {
                                        db.collection("streaks").document(document.documentID).updateData(["user0_time": FirebaseFirestore.Timestamp.init()])
                                    } else {
                                        db.collection("streaks").document(document.documentID).updateData(["user1_time": FirebaseFirestore.Timestamp.init()])
                                    }
                                    
                                    
                                }
                            }
                    }
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
