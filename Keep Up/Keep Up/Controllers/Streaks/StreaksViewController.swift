//
//  StreaksViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class StreaksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    let db = Firestore.firestore()
    var users = [""]
    var streaksNumArray = [Int]()
    var streaksArray = [[String:Any]]()
    var streaksID = [String]()
    var habitsArray = [String]()
    var friendsArray = [String]()
    //var streakNum = 0
    //var friendsArray = [[String:Any]]()
    //var friendsID = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        //updateStreaks()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        streaksArray.removeAll()
        streaksNumArray.removeAll()
        habitsArray.removeAll()
        friendsArray.removeAll()
        streaksID.removeAll()
        users.removeAll()
        updateStreaks()
        print(habitsArray)
        print(streaksNumArray)
        print(friendsArray)
        print("STREAKS ARRAY => \(streaksArray)")
    }
    
    var friendNames = ["Carl", "Jamie", "Tom", "Jose", "Tiff"]
    //var myDays = [] as [String]
    var friendHabits = ["Yoga", "Meditation", "Exercise", "Reading", "Sleeping"]
    //var myStreaks = [] as [Int]
    var friendStreaks = [4, 2, 4, 23, 44]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //maybe error if multiple habits w/ one friend or multiple friends with one habit dep on how the data is queried
        print("STREAKSID.COUNT => \(streaksID.count)")
        return self.streaksID.count
        
       }
    
    
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StreaksTableViewCell", for: indexPath) as! StreaksTableViewCell
        
        //cell.friendName.text = friendNames[indexPath.row]
        //cell.habitName.text = friendHabits[indexPath.row]
        //cell.friendStreak.text = "Our Streak: " + String(friendStreaks[indexPath.row])
        
        cell.friendName.text = self.friendsArray[indexPath.row]
        cell.habitName.text = self.habitsArray[indexPath.row]
        cell.friendStreak.text = "Our Streak: " + String(self.streaksNumArray[indexPath.row])
        
        return cell
       }
    
    
    func updateStreaks(){
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            let userEmail = user?.email
            
            db.collection("streaks").whereField("users", arrayContains: userEmail!)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        // for each streak:
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            
                            self.streaksArray.append(document.data())
                            self.streaksID.append(document.documentID)
                            self.habitsArray.append(document.data()["habit"] as! String)
                            
                            
                            // update startTime only if streak is broken
                            let user0Time = (document.data()["user0_time"]! as AnyObject).dateValue()
                            let user1Time = (document.data()["user1_time"]! as AnyObject).dateValue()
                            let startTime = (document.data()["startTime"]! as AnyObject).dateValue()
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
                                //SET STREAK TO ZERO
                                self.streaksNumArray.append(0)
                                //self.db.collection("streaks").document(document.documentID).updateData(["startTime": FirebaseFirestore.Timestamp.init()])
                            }else{
                                let timeInSeconds = now.timeIntervalSince(startTime)
                                let timeInDays = Int(timeInSeconds/86400)
                                self.streaksNumArray.append(timeInDays)
                                //SET STREAK TO timeInDays
                            }
                            
                            // update your time in the streak
                            self.users = document.data()["users"]! as! Array
                            if (self.users[0] == userEmail!) {
                                self.db.collection("streaks").document(document.documentID).updateData(["user0_time": FirebaseFirestore.Timestamp.init()])
                                //adding user1 as friend
                                self.friendsArray.append(self.users[1])
                            } else {
                                self.db.collection("streaks").document(document.documentID).updateData(["user1_time": FirebaseFirestore.Timestamp.init()])
                                self.friendsArray.append(self.users[0])
                            }
                            
                            
                        }
                    }
                    self.tableView.reloadData()
            }
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
        print("streaks array count: \(self.streaksID.count)")
        
    }
    
}
