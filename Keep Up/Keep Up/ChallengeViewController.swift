//
//  ChallengeViewController.swift
//  Keep Up
//
//  Created by Jenny H on 12/19/20.
//

import UIKit
import FirebaseDatabase

class ChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    //var postData = ["Eat an Apple", "Take a walk", "Drink-Water"]
    var postData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.init(red: 253/255, green: 247/255, blue: 231/255, alpha: 1)
        
        //Set the firebase database reference
        ref = Database.database().reference()
        
        //Retrieve the posts and listen for changes
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            
            //Code to execute when a child is added under "Posts"
            //take the value from the snapshot and add it to the postData-array
            
            //Try to convert the value of the data to a string
            let challenge_post = snapshot.value as? String
            
            if let actualPost = challenge_post {
                
                //Append the data to our postData array
                self.postData.append(actualPost)

                
                //Reload the tableview
                self.tableView.reloadData()
            }
            
        })
    }
    //var postData = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return postData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
            cell?.textLabel?.text = postData[indexPath.row]
            
            return cell!
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
