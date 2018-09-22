//
//  CoreDataHandler.swift
//  CoreDataMigration
//
//  Created by pankaj on 01/01/18.
//  Copyright © 2018 pankaj. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHandler {
    static var instance: CoreDataHandler?
    var coreDataManagerMigrationModel: CoreDataManager? = nil // Here we can list more Object models for more than one Core data managed object models
    var coreDataManagerMigrationClientModel: CoreDataManager? = nil // Here we can list more Object models for more than one Core data managed object models

    static func sharedInstance() -> CoreDataHandler {
        if instance == nil {
            instance = CoreDataHandler()
            instance?.coreDataManagerMigrationModel = CoreDataManager(modelName: "CoreDataMigration")
            instance?.coreDataManagerMigrationClientModel = CoreDataManager(modelName: "CoreDataMigrationClient")
            return instance!
        } else {
            return instance!
        }
    }
    
}
