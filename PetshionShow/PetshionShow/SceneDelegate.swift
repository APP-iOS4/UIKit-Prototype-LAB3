//
//  SceneDelegate.swift
//  PetshionShow
//
//  Created by 최정인 on 1/17/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let recommendViewController = RecommendViewController()
        recommendViewController.tabBarItem = UITabBarItem(title: "추천", image: UIImage(systemName: "hand.thumbsup"), tag: 0)
        
        let rankingViewController = RankingViewController()
        rankingViewController.tabBarItem = UITabBarItem(title: "랭킹", image: UIImage(systemName: "trophy"), tag: 1)
        
        let wishListViewController = WishListViewController()
        wishListViewController.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "bag"), tag: 2)
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [recommendViewController, rankingViewController, wishListViewController]
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

