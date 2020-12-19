//
//  PostChallengeViewController.swift
//  Keep Up
//
//  Created by Jenny H on 12/19/20.
//

import UIKit


import FirebaseFirestore
import Firebase
import FirebaseDatabase




class PostChallengeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = "olaaaa"
        let age = 12
        
        var dict: [String: Any] = ["name": name, "age": age]
        
        let db = Firestore.firestore()
        
        //db.collection("newcollection").document("Olaf").collection("a_habit").addDocument(data:dict)
        //db.collection("newcollection").addDocument(data:dict)
        //db.collection("newcollection").document("Test").setData(dict)
        db.collection("users").document("grant").collection("myHabits").document("xhabit").collection("xday").addDocument(data:dict)
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
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
