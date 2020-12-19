//
//  DetailHabitViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit

class DetailHabitViewController: UIViewController {
    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var habitDescTextField: UITextField!
    
 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! HabitViewController
        destVC.myHabits.append("new habit")
        destVC.myDays.append("new day")
        destVC.myStreaks.append(5)
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
