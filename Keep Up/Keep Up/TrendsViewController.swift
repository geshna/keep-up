//
//  TrendsViewController.swift
//  Keep Up
//
//  Created by Grace Gao on 12/19/20.
//

import UIKit
import Charts
import QuartzCore
import Firebase
import FirebaseAuth
import FirebaseFirestore

class TrendsViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var indicate_label: UILabel!
    var pieChart = PieChartView()
    
    //var lineChart = LineChartView()
    //, ChartViewDelegate
    //Bar Chart Code
   // var barChart = BarChartView()
    
    let db = Firestore.firestore()
    @IBOutlet weak var intro_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //barChart.delegate = self
        //lineChart.delegate = self
        pieChart.delegate = self
        intro_label.layer.masksToBounds = true
        intro_label.layer.cornerRadius = 20.0

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews(){
        
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [PieChartDataEntry]()
        var temp_entries = [String]()
        /// Looping through the habits
       // print("GONE THROUGH HERE")
        if Auth.auth().currentUser != nil {
            
            //print("NOW THROUGH AUTH")
            let user = Auth.auth().currentUser
            let userEmail = user?.email
            //document(userEmail!).collection("habits")
            
            db.collection("users").document(userEmail!).collection("habits").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    //print("IN ELSE STATEMETN")
                    var vari = 0
                    for document in querySnapshot!.documents {
                        //print("IN LOOP")
                        let docId = document.documentID
                        //.append(PieChartDataEntry(value: 10, label: docId))
                        temp_entries.append(docId)
                        print(temp_entries[vari])
                        vari+=1
                    }
                    
                    
                    
                    if(temp_entries.isEmpty){
                        entries.append(PieChartDataEntry(value: 1.0, label: "No Habits Logged Yet!"))
                        self.indicate_label.text = "No Habits Yet!"
                    }
                    else{
                    for entry in temp_entries {
                        
                        print(entry)
                        entries.append(PieChartDataEntry(value: 10.0,
                                                         label: entry))
                    }
                        
                        self.indicate_label.text = "Look at how many days!"
                    
                    }
                    
                    
                    let set = PieChartDataSet(entries: entries, label: "")
                    
                    set.colors = ChartColorTemplates.material()
                    
                    let data = PieChartData(dataSet: set)
                    self.pieChart.data = data
                }
                
                
            }
        }
        

       /*
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x),
                                            y: Double(x)))
        }
        */
        //entries.append(PieChartDataEntry(value: 10, label: "Singing"))
        let set = PieChartDataSet(entries: entries, label: "")
        
        set.colors = ChartColorTemplates.material()
        
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        
        /*
        lineChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x),
                                            y: Double(x)))
        }
        
        let set = LineChartDataSet(entries: entries)
        
        set.colors = ChartColorTemplates.material()
        
        let data = LineChartData(dataSet: set)
        lineChart.data = data  */
        
       /* barChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x),
                                            y: Double(x)))
        }
        
        let set = BarChartDataSet(entries: entries)
        
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        barChart.data = data */
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
