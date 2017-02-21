//
//  CompleteTaskViewController.swift
//  ToDoThings
//
//  Created by Kunal Dhingra on 2017-02-21.
//  Copyright © 2017 Kunal Dhingra. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    
    //MARK:Properties
    
    var task = Task()
    var previousVC = ViewController()
    
    @IBOutlet weak var textFieldName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task.important == true{
            textFieldName.text = "❗️\(task.name)"
        }
        else{
            textFieldName.text = task.name
        }
        
    }
    
    //MARK:Actions
    

    @IBAction func compteteTapped(_ sender: AnyObject) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
