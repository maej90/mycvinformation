//
//  AppDelegate.swift
//  MyCV
//
//  Created by Marco Espinal on 31/01/20.
//  Copyright © 2020 Marco Espinal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		window = UIWindow(frame: UIScreen.main.bounds)
		let initialViewController = MyCVBuilder.buildCV()
		window?.rootViewController = initialViewController
		window?.makeKeyAndVisible()
		return true
	}

}

