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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let db = Firestore.firestore()
        
        db.collection("newcollection").document("haley@gmail.com").collection("myHabits").document("xhabit").collection("xday").addDocument(data:dict)
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
