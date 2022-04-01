//
//  AppDelegate.swift
//  GTT
//
//  Created by ADMS on 15/02/22.
//

import UIKit
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared().isEnabled = true

        if let result  = UserDefaults.standard.value(forKey: "isLogin"){
//            let json = JSON(result)
            if (result as! String == "1")
            {
                PushTLoginViewController()
            }else
            {
                PushToRootViewController()
            }
        }else
        {
            PushToRootViewController()
        }

        return true
    }
    func PushToRootViewController()
    {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
       // rootVC.navigationController?.navigationBar.isHidden = true
        let frontNavigationController = UINavigationController(rootViewController: rootVC)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = frontNavigationController
        self.window?.makeKeyAndVisible()
    }
    func PushTLoginViewController()
    {
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
        let frontNavigationController = UINavigationController(rootViewController: rootVC)
       // rootVC.navigationController?.navigationBar.isHidden = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = frontNavigationController
        self.window?.makeKeyAndVisible()
    }
}

