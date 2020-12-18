//
//  SummaryViewController.swift
//  Keep Up
//
//  Created by Grace Gao on 12/18/20.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var friends_button: UIButton!
    @IBOutlet weak var awards_button: UIButton!
    @IBOutlet weak var trends_button: UIButton!
    @IBOutlet weak var habits_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        habits_button.layer.cornerRadius = 25.0
        awards_button.layer.cornerRadius = 25.0
        trends_button.layer.cornerRadius = 25.0
        friends_button.layer.cornerRadius = 25.0
        // Do any additional setup after loading the view.
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
