//
//  AppDelegate.swift
//  MVI Example Login
//
//  Created by Ajay Mann on 7/13/18.
//  Copyright © 2018 Ajay Mann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        guard let `window` = window else { return false }
        window.makeKeyAndVisible()
        let reactor = LoginReactor()
        window.rootViewController = LoginViewController(reactor: reactor)
        return true
    }


}

