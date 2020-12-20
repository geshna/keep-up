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
    
    //var friendsArray = [[String:Any]]()
    //var friendsID = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self

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
    

    func newStreak(){
        
    }
    
    func updateStreaks(){
        
        
        
    }
    
    /*
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
     */

}
