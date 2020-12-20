//
//  DetailHabitViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class DetailHabitViewController: UIViewController {
    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var habitDescTextField: UITextField!
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        habitNameTextField.delegate = self
        habitDescTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! HabitViewController
        //destVC.myHabits.append("new habit")
        //destVC.myDays.append("new dates")
        //destVC.myStreaks.append(5)
        destVC.myHabits.append("\(habitNameTextField.text!)")
        destVC.myDays.append("\(habitDescTextField.text!)")
        destVC.myStreaks.append(5)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }*/
    
     @IBAction func saveButtonPressed(_ sender: Any) {
        addHabit()
     }
     
    private func addHabit() {
        let db = Firestore.firestore()
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            let userEmail = user?.email
           
            db.collection("users").document(userEmail!).collection("habits").document(habitNameTextField.text!).collection("habitDays").document("init").setData(["date": FirebaseFirestore.Timestamp.init()])
            
        } else {
          // No user is signed in.
          // ...
            print("ERROR IN FINDING USER: NO USER IS SIGNED IN")
        }
    }

}

extension DetailHabitViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
