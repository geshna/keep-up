//
//  TempViewController.swift
//  Keep Up
//
//  Created by Geshna Aggarwal on 12/19/20.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class TempViewController: UIViewController {

    var dict: [String: Any] = ["name": "hi", "age": 7]
    let db = Firestore.firestore()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        //db.collection("newcollection").document("haley@gmail.com").collection("myHabits").document("xhabit").collection("xday").addDocument(data:dict)
        addHabits()
    }
    
    func addHabits() {
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            let userEmail = user?.email
            var i = 0
            
            self.db.collection("users").document(userEmail!).collection("habits").document("xhabit").setData(dict)
           
            
            
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
        
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
