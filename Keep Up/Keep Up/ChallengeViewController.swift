//
//  ChallengeViewController.swift
//  Keep Up
//
//  Created by Jenny H on 12/19/20.
//

import UIKit

class ChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postData = ["Eat Apple","Walk Honey","Drink Water"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
            cell?.textLabel?.text = postData[indexPath.row]
            
            return cell!
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
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
