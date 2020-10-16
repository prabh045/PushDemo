//
//  AppDelegate.swift
//  pushDemo
//
//  Created by Prabhdeep Singh on 14/10/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit
import UserNotifications
import PushService

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PushService.subscribe()
        PushService.getPermissionStatus(completion: { (status) in
            print("1",status)
        })
        print("2",PushService.getSubscriptionStatus())
        print("3",PushService.getSubscriptionToken() ?? "NIL")
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}


//extension AppDelegate: UNUserNotificationCenterDelegate {
//
//    func regiserForNotification(){
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, _ ) in
//            print("Permission granted: \(granted)")
//            guard granted else { return }
//            self.getNotificationSettings()
//        }
//    }
//
//    func getNotificationSettings() {
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            print("settings are \(settings)")
//
//            switch settings.authorizationStatus {
//            case .authorized:
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//
//
//            default:
//                break
//            }
//
//        }
//
//        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//            let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
//            let token = tokenParts.joined()
//            print("Device Token: \(token)")
//        }
//
//        func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//            print("failed, \(error.localizedDescription)")
//        }
//
//}


