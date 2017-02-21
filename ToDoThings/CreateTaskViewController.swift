//
//  CreateTaskViewController.swift
//  ToDoThings
//
//  Created by Kunal Dhingra on 2017-02-21.
//  Copyright © 2017 Kunal Dhingra. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    
    //MARK:Properties
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    //MARK: Actions
    
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        let task = Task()
        
        task.name = textField.text!
        task.important = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }

}
