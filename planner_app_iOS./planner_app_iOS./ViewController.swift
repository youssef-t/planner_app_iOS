//
//  ViewController.swift
//  planner_app_iOS.
//
//  Created by Youssef Taleb on 05/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todayTasks: UIButton!
    @IBOutlet weak var allPlanning: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickTodayTasks(_ sender: UIButton) {
    }
    
    
    @IBAction func clickAllPlanning(_ sender: UIButton) {
        present(ViewControllerAllPlanning(), animated: true)
        //let 
    }
}

/*
class Task {
    var date = Date()
    var taskName: String
    //small, medium, urgent
    var taskImportance: String
    var taskImportanceValueInt: Int
    
    init(_ date_l: Date, _ taskName_l: String, _ taskImportance_l: String = "urgent"){
        date = date_l
        taskName = taskName_l
        taskImportance = taskImportance_l
        if taskImportance == "small" {
            taskImportanceValueInt = 0
        } else if taskImportance == "medium" {
            taskImportanceValueInt = 1
        } else {				
            taskImportanceValueInt = 2 //urgent
        }
        //var datePicker = UIDatePicker()
        
    }
    
}
 */

