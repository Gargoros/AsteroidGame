//
//  AsteroidsClassicAppDelegate.swift
//  AsteroidsClassicGame  AsteroidsClassic
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import Foundation

import UIKit

class AsteroidsClassicAppDelegate : NSObject, UIApplicationDelegate {
    static private(set) var instance: AsteroidsClassicAppDelegate?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AsteroidsClassicAppDelegate.instance = self
        AsteroidsClassicUserDefaults.initializeDefaultShip()
        return true
    }
    static var orientationLock = UIInterfaceOrientationMask.portrait {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: orientationLock))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if orientationLock != .portrait {
                    AsteroidsClassicAppDelegate.orientationLock = UIInterfaceOrientationMask.all
                    UIDevice.current.setValue(UIInterfaceOrientationMask.all.rawValue, forKey: AsteroidsClassicAppConstants.dataKeys.orientation.rawValue)
                    UINavigationController.attemptRotationToDeviceOrientation()
                } else {
                    AsteroidsClassicAppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                    UIDevice.current.setValue(UIInterfaceOrientationMask.portrait.rawValue, forKey: AsteroidsClassicAppConstants.dataKeys.orientation.rawValue)
                    UINavigationController.attemptRotationToDeviceOrientation()
                }
            }
        }
    }
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AsteroidsClassicAppDelegate.orientationLock
    }
}
