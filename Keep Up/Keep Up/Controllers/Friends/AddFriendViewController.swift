//
//  AddFriendViewController.swift
//  Keep Up
//
//  Created by Geshna Aggarwal on 12/18/20.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AddFriendViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var lookButton: UIButton!
    
    @IBOutlet weak var emailEnteredLabel: UILabel!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func lookButtonPressed(_ sender: Any) {
        
        //var textEntered = emailTextField.text
        
        let emailEntered = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        emailTextField.text = ""
        emailEnteredLabel.text = emailEntered
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            
            var i = 0
           
            //finds friend based on user entered email
            let friend = db.collection("users").whereField("email", isEqualTo: emailEntered).limit(to: 1)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents{
                            print("\(document.documentID) => \(document.data())")
                            
                            //let friendDocRef = self.db.collection("users").document(MyVariables.docId).collection("friends").
                            
                            //creates document in current user's friend list for the friend that was entered
                            let friendDocRef = self.db.collection("users").document(MyVariables.docId).collection("friends").document(emailEntered)
                            friendDocRef.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    print("friend already exists")
                                    i = 1
                                }else{
                                    print("creating friend")
                                    
                                }
                            }
                            
                           if i == 0 {
                                //self.db.collection("users").document(MyVariables.docId).collection("friends").addDocument(data: document.data())
                            print("added friend")
                            self.db.collection("users").document(MyVariables.docId).collection("friends").document(emailEntered).setData(document.data())
                            print("DOC ID MY VARIABLES: \(MyVariables.docId)")
                           }
                            //self.db.collection("users").document(MyVariables.docId).collection("friends").addDocument(data: document.data())
                            
                        }
                    }
                }
            
            
            
            
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
