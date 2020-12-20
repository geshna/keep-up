//
//  DetailHabitViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit

class DetailHabitViewController: UIViewController {
    @IBOutlet weak var habitNameTextField: UITextField!
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        habitNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! HabitViewController
        //destVC.myHabits.append("new habit")
        //destVC.myDays.append("new dates")
        //destVC.myStreaks.append(5)
        destVC.myHabits.append("\(habitNameTextField.text!)")
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

extension DetailHabitViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
