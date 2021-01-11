//
//  ViewControllerAddTask.swift
//  planner_app_iOS.
//
//  Created by Youssef Taleb on 11/01/2021.
//

import UIKit

class ViewControllerAddTask: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let importanceDegree:[String] = [ "small", "medium", "urgent"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return importanceDegree.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return importanceDegree[row]
    }
    
    var importanceSelectedByPickerView = "medium"
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        importanceSelectedByPickerView = importanceDegree[row]
    }


    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var toDoBefore: UIDatePicker!
    @IBOutlet weak var selectImportance: UIPickerView!
    @IBOutlet weak var addTask: UIButton!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var toDoBeforeLabel: UILabel!
    @IBOutlet weak var importanceLabel: UILabel!
    
    
    @IBAction func addTask(_ sender: Any) {
        let task_name: String = taskName.text!
        let date_to_do_before = toDoBefore.date
        let importance = importanceSelectedByPickerView
        //let task = Task(date_to_do_before, task_name, importance)
//        let task = Task
        //var movie: [Task] 
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectImportance.dataSource = self
        selectImportance.delegate = self
        
        
    }
    

    

}
