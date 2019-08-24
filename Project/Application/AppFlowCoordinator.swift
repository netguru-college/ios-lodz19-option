//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow
    
    private var homeFlowCoordinator: HomeFlowCoordinator
    private var searchFlowCoordinator: SearchFlowCoordinator
    private var profileFlowCoordinator: ProfileFlowCoordinator


    init(window: UIWindow) {
        
        initializeCoordinators()
        let tabbarViewController = UITabBarController()
        
        tabbarViewController.viewControllers = [
            homeFlowCoordinator.rootViewController,
            searchFlowCoordinator.rootViewController,
            profileFlowCoordinator.rootViewController
        ]
   
        self.window = window
    }
    
    private func initializeCoordinators() {
        searchFlowCoordinator = SearchFlowCoordinator()
        homeFlowCoordinator = HomeFlowCoordinator()
        profileFlowCoordinator = ProfileFlowCoordinator()
    }

    func initializeApp() {
        let viewController = HelloWorldViewController(delegate: self)
        rootViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}
