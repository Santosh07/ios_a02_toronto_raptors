//
//  AppDelegate.swift
//  A02-Toronto-Raptors
//
//  Created by Santosh - Humber on 2023-06-11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var tickets = [
        TicketInfo(ticketType: TicketType.balcony, availableQuantity: 12, price: 1170),
        TicketInfo(ticketType: TicketType.lower, availableQuantity: 20, price: 10434),
        TicketInfo(ticketType: TicketType.courtside , availableQuantity: 15, price: 27777)
    ]
    
    var orderHistory: [TicketOrder] = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

