//
//  SceneDelegate.swift
//  Project2
//
//  Created by admin on 26/02/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var baseController : UITabBarController?

    func creatTabBar(){
        var tabControllers : [UIViewController] = []
        
        //half rang two dots, full range three dots 0...3
        for i in 0..<4{
            var tabController : UIViewController!
            var subController : UINavigationController!
            switch i {
            case 0: //multi cases using , eg: case 0,1,2:
                tabController = ViewController()
                // binding VC1 and NC1 and now NC1 becomes relative to tabbar
                subController = UINavigationController(rootViewController: tabController)//root: start of controller
                subController.tabBarItem.title = "Home"
                subController.tabBarItem.image = UIImage(named:"home")
                subController.navigationBar.topItem?.title="Home"
            case 1:
                tabController = PDFViewController()
                // binding VC2 and NC2 and now NC2 becomes relative to tabbar
                subController = UINavigationController(rootViewController: tabController)//root: start of controller
                subController.tabBarItem.title = "Documents"
                subController.tabBarItem.image = UIImage(named:"offers")
                subController.navigationBar.topItem?.title="Patient PDF"
            case 2:
                tabController = AppViewController()
                // binding VC3 and NC3 and now NC3 becomes relative to tabbar
                subController = UINavigationController(rootViewController: tabController)//root: start of controller
                subController.tabBarItem.title = "Calc"
                subController.tabBarItem.image = UIImage(named:"apps")
                subController.navigationBar.topItem?.title="Calc"
          
            case 3:
                tabController = RestDemoViewController()
                subController = UINavigationController(rootViewController: tabController)//root: start of controller
                subController.tabBarItem.title = "Rest"
                subController.tabBarItem.image = UIImage(named:"reviews")
                subController.navigationBar.topItem?.title="Title Name"
//                subController.navigationBar.largeContentImage = UIImage(named:"reviews")
            default:
                tabController = nil
            }
            tabControllers.append(subController)
        }
        baseController = UITabBarController()
        baseController?.viewControllers = tabControllers
        
        window?.rootViewController = baseController
        
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        if baseController == nil {
            creatTabBar()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

