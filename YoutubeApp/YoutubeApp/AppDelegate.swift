//
//  AppDelegate.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 26/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = VideoListVC(nibName: "VideoListVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
    
}
