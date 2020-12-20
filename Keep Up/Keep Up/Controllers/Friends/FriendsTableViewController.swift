//
//  FriendsTableViewController.swift
//  Keep Up
//
//  Created by Geshna Aggarwal on 12/18/20.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FriendsTableViewController: UITableViewController {

    
   
    let db = Firestore.firestore()
    var friendsArray = [[String:Any]]()
    var friendsID = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        loadFriends()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        friendsArray.removeAll()
        friendsID.removeAll()
        loadFriends()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.friendsID.count
    }

    func loadFriends(){
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            //let uid = user?.uid
            let userEmail = user?.email
            
            let friendsRef = db.collection("users").document(userEmail!).collection("friends")
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents{
                            print("\(document.documentID) => \(document.data())")
                            self.friendsArray.append(document.data())
                            self.friendsID.append(document.documentID)
                        }
                    }
                    print("friends ID ==> \(self.friendsID)")
                    print("friends array ==> \(self.friendsArray)")
                    self.tableView.reloadData()
                }
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
        print("friends array count: \(self.friendsArray.count)")
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)

        let friend = friendsArray[indexPath.row]
        let displayName = friend["displayName"]
        //print("display name: \(displayName)")
        //let idName = id[""]
        //print("idName:\(idName) and id: \(id)")
        cell.textLabel!.text = displayName as! String
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
