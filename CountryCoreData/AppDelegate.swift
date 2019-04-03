//
//  AppDelegate.swift
//  CountryCoreData
//
//  Created by SHILEI CUI on 4/2/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DatabaseManager.shared.applicationDocumentsDirectory()
        return true
    }

}

