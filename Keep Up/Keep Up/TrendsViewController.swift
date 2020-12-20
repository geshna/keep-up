//
//  TrendsViewController.swift
//  Keep Up
//
//  Created by Grace Gao on 12/19/20.
//

import UIKit
import Charts
import QuartzCore

class TrendsViewController: UIViewController, ChartViewDelegate {
    
    var pieChart = PieChartView()
    
    //var lineChart = LineChartView()
    //, ChartViewDelegate
    //Bar Chart Code
   // var barChart = BarChartView()
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
        
        entries.append(PieChartDataEntry(value: 50, label: "Singing"))
        entries.append(PieChartDataEntry(value: 20, label: "Sleeping"))
        entries.append(PieChartDataEntry(value: 10, label: "Cooking"))
        entries.append(PieChartDataEntry(value: 10, label: "Cleaning"))
        
       /*
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x),
                                            y: Double(x)))
        }
        */
        let set = PieChartDataSet(entries: entries)
        
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
