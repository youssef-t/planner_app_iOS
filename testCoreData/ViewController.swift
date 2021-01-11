//
//  ViewController.swift
//  testCoreData
//
//  Created by d0m on 24/10/2018.
//  Copyright © 2018 d0m. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let identifiant = "itemCell"
    
    //var items = [String] ()
   // var dates = [Date] ()
    
    // a single object array stored in Core Data; you must use it to create, edit, save and delete from your Core Data persistent store.
    // Will replace items and dates
    var managedObjectContext:NSManagedObjectContext?
    var managedObjects: [NSManagedObject] = []
    
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemField.delegate = self
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        // Step 1: Init Core Data context
        initCoreData()
        
        // Step 2: load the data from the persistent store
        loadData()
        
        //deleteData()
 
    }
    
    // Initialization of Core Data
    func initCoreData () {
        // Step 1: Create the managed object context
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    // Load the data at application launch
    func loadData() {
        // Step 1: Create a fetch request meeting the criteria "Item".
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        // Step 2: Fetch and store the data into the managed objects
        do {
            // Returns an array
            managedObjects = try managedObjectContext!.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func saveData(name: String, date: Date) {
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Item", in: managedObjectContext!)!
        let currentItem = NSManagedObject(entity: entity, insertInto: managedObjectContext!)
        // 3
        currentItem.setValue(name, forKeyPath: "label")
        currentItem.setValue(date, forKeyPath: "date")

        // 4
        do {
            try managedObjectContext!.save()
            managedObjects.append(currentItem)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func deleteData () {
        // Delete all the items
        for item in managedObjects {
            managedObjectContext!.delete(item)
        }
        do {
            try managedObjectContext!.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //items.append(textField.text!)
        self.saveData(name: textField.text!, date: Date())
        textField.text = ""
        textField.resignFirstResponder()
        itemsTableView.reloadData()
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return managedObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiant, for: indexPath) as! TableViewCell
        let row = indexPath.row
        let currentItem = managedObjects[row]
        let label = currentItem.value(forKeyPath: "label") as? String
        cell.itemLabel.text = label
        let date = currentItem.value(forKey: "date") as? Date
        cell.itemDate.text = date?.description
        return cell
    }


}

