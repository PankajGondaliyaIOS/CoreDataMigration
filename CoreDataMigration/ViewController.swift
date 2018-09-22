//
//  ViewController.swift
//  CoreDataMigration
//
//  Created by pankaj on 01/01/18.
//  Copyright © 2018 pankaj. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Employee
        CoreDataBusinessLogic.sharedInstance().addEmployee(strEmployeeName: "Pankaj Gondaliya")
        CoreDataBusinessLogic.sharedInstance().fetchAllEmployees()
        
        //Client
        CoreDataBusinessLogic.sharedInstance().addClient(strClientName: "Gondaliya Pankaj")
        CoreDataBusinessLogic.sharedInstance().fetchAllClient()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//MARK: Coredata functions
extension ViewController {
    
}
