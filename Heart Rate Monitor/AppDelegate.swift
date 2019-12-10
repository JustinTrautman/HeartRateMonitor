//
//  AppDelegate.swift
//  Heart Rate Monitor
//
//  Created by Justin Trautman on 8/5/19.
//  Copyright © 2019 Watch Coder. All rights reserved.
//

import HealthKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - HealthKit
    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        let healthStore = HKHealthStore()
        healthStore.handleAuthorizationForExtension { (success, error) in
        }
    }
    
    func requestHealthKitPermission() {
        let sampleType: Set<HKSampleType> = [HKSampleType.quantityType(forIdentifier: .heartRate)!]
        let healthStore = HKHealthStore()
        
        healthStore.requestAuthorization(toShare: sampleType, read: sampleType) { (success, error) in
            if let error = error {
                print("Error requesting health kit authorization: \(error)")
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.requestHealthKitPermission()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}

