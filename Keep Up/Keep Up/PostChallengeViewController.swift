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
    
    
    @IBOutlet weak var textViewChallenge: UITextView!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addChallenge(_ sender: Any) {
        //TO DO: Post the data to firebase
        ref?.child("Posts").childByAutoId().setValue(textViewChallenge.text)
        //Dismiss this popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelChallenge(_ sender: Any) {
        //Dismiss this popover
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
