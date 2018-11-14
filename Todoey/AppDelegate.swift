//
//  AppDelegate.swift
//  Todoey
//
//  Created by Saran Siriwatanametanon on 11/11/2561 BE.
//  Copyright © 2561 Saran Siriwatanametanon. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("did finish luanching with options")
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!)
       
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        }catch{
            print("error \(error)")
        }
        
        return true
    }
    

   


}

