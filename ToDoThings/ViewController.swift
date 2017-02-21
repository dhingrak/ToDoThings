//
//  ViewController.swift
//  ToDoThings
//
//  Created by Kunal Dhingra on 2017-02-21.
//  Copyright © 2017 Kunal Dhingra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK:Properties

    @IBOutlet weak var tableView: UITableView!
    
    var tasks:[Task] = []
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //Mark:TableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important == true{
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else{
            cell.textLabel?.text = task.name
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "deleteTask", sender: task)
    }
    
    // Mark: Functions
    
    func makeTasks() -> [Task]{
    
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Go to Gym"
        task2.important = true

        let task3 = Task()
        task3.name = "Mow thw lawn"
        task3.important = false
        
        let task4 = Task()
        task4.name = "Practice your communication skills"
        task4.important = true
        
        return[task1, task2, task3, task4]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue"{
            
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        else if segue.identifier == "deleteTask"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

