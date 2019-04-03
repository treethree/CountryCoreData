//
//  DatabaseManager.swift
//  CountryCoreData
//
//  Created by SHILEI CUI on 4/2/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation
import CoreData

class DatabaseManager{
    static let shared = DatabaseManager()
    private init(){}
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CountryCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var mainContext : NSManagedObjectContext{
        
        //viewContext is attached to main queue (serial queue)
        return persistentContainer.viewContext
    }
    
    func saveContext(context: NSManagedObjectContext){
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("error in saving context")
            }
        }
    }
    
    func addCountry(name: String, population: Int32, capital: String, flag: String){
        
        //another way to implement background context
        persistentContainer.performBackgroundTask { (bgContext) in
            //let bgContext = self.persistentContainer.newBackgroundContext()
            let coun = Country(context: bgContext)
            coun.name = name
            coun.capital = capital
            coun.population = population
            coun.flag = flag
            
            let insertObjs = [NSInsertedObjectsKey: [coun.objectID]]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: insertObjs, into: [self.mainContext])
            
            self.saveContext(context: bgContext)
        }
    }
    
    func fetchCountry() -> [Country]{
        let countryFetchReq : NSFetchRequest<Country> = Country.fetchRequest()
        do{
            let ctys = try mainContext.fetch(countryFetchReq)
            return ctys
        }catch{
            print("error in fetching")
        }
        return []
    }
    //get the directory for application core database
    func applicationDocumentsDirectory() {
        if let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
            print(url.absoluteString)
        }
    }
    
}

