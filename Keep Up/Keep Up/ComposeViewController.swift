//
//  ComposeViewController.swift
//  
//
//  Created by Jenny H on 12/19/20.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textbox: UITextView!
    @IBOutlet weak var label: UILabel!
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        MyVariables.docId = "hihi"
        label.text = String(MyVariables.docId)
        //label.text = "hi"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addPost(_ sender: Any) {
        
        //To do: post data to firebase
        
        db = Firestore.firestore()
        var ref: DocumentReference? = nil
        let user = Auth.auth().currentUser
        if let user = user {
            let userId = user.uid
        }
        //db.collection("users").whereField("uid", isEqualTo: userId).getDocuments() {
        //    (querySnap)
        //}
        
        
        
        //dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        //dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
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
