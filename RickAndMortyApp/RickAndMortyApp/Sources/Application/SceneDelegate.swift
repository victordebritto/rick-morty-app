//
//  SceneDelegate.swift
//  RickAndMortyApp
//
//  Created by Victor Britto e Barros on 09/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)

        let controller = ViewController()

        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

