//
//  SceneDelegate.swift
//  BerkayDemo
//
//  Created by Berkay Sebat on 7/16/21.
//

import UIKit

@available(iOS 13.0, *)

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
              let window = UIWindow(windowScene: windowScene)
              window.rootViewController = UINavigationController.init(rootViewController: FeedViewController())
              self.window = window
              window.makeKeyAndVisible()
              UINavigationBar.appearance().backgroundColor = UIColor(red: 1.00, green: 0.16, blue: 0.32, alpha: 1.00)
    }
}

