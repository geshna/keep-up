//
//  AddStreakViewController.swift
//  Keep Up
//
//  Created by Geshna Aggarwal on 12/19/20.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class AddStreakViewController: UIViewController {

    let db = Firestore.firestore()
    @IBOutlet weak var habitTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var addStreakButton: UIButton!
    
    @IBOutlet weak var createdStreakLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdStreakLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        createdStreakLabel.alpha = 0
    }

    @IBAction func addStreakButtonPressed(_ sender: Any) {
        
        let emailEntered = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let habitEntered = habitTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            let userEmail = user?.email
            
            var streakID = habitEntered + emailEntered + userEmail!
            
            self.db.collection("streaks").document(streakID).setData(["habit":habitEntered,
                                                                      "startTime":FirebaseFirestore.Timestamp.init(),
                                                                      "user0_time":FirebaseFirestore.Timestamp.init(),
                                                                      "user1_time":FirebaseFirestore.Timestamp.init(),
                                                                      "users":[emailEntered, userEmail]])
            self.createdStreakLabel.text = "Successfully created a streak for \(habitEntered) with \(emailEntered)!"
            self.createdStreakLabel.alpha = 1
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
           
            //finds friend based on user entered email
            
            
    }
    
    

}
