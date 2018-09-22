//
//  CoreDataBusinessLogic.swift
//  CoreDataMigration
//
//  Created by pankaj on 01/01/18.
//  Copyright © 2018 pankaj. All rights reserved.
//

import Foundation
import CoreData

class CoreDataBusinessLogic {
    static var instance: CoreDataBusinessLogic?
    
    static func sharedInstance() -> CoreDataBusinessLogic {
        if instance == nil {
            instance = CoreDataBusinessLogic()
            return instance!
        } else {
            return instance!
        }
    }

}

//MARK: Employee Object Model
extension CoreDataBusinessLogic {
    
    func addEmployee(strEmployeeName: String) {
        let employ = Employee(context:  (CoreDataHandler.sharedInstance().coreDataManagerMigrationModel?.managedObjectContext)!)
        employ.empName = strEmployeeName
        do {
            try employ.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            print("Unable to Save Employ")
            print("\(saveError), \(saveError.localizedDescription)")
        }
        //Save parent context and thus, saving the persistence store
        NotificationCenter.default.post(name: Notification.Name.UIApplicationDidEnterBackground, object: nil, userInfo: nil)
    }
    
    func fetchAllEmployees() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try CoreDataHandler.sharedInstance().coreDataManagerMigrationModel?.managedObjectContext.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "empName") as! String)
            }
        } catch {
            print("Failed")
        }
    }

}

//MARK: Client Object Model
extension CoreDataBusinessLogic {
    func addClient(strClientName: String) {
        let client = Client(context:  (CoreDataHandler.sharedInstance().coreDataManagerMigrationClientModel?.managedObjectContext)!)
        client.clientName = strClientName
        do {
            try client.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            print("Unable to Save Employ")
            print("\(saveError), \(saveError.localizedDescription)")
        }
        //Save parent context and thus, saving the persistence store
        NotificationCenter.default.post(name: Notification.Name.UIApplicationDidEnterBackground, object: nil, userInfo: nil)
    }
    
    func fetchAllClient() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Client")
        request.returnsObjectsAsFaults = false
        do {
            let result = try CoreDataHandler.sharedInstance().coreDataManagerMigrationClientModel?.managedObjectContext.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "clientName") as! String)
            }
        } catch {
            print("Failed")
        }
    }
}
