//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    
    // MARK: - Properties
    
    private let window: UIWindow
    
    private var homeFlowCoordinator: HomeFlowCoordinator
    private var searchFlowCoordinator: SearchFlowCoordinator
    private var profileFlowCoordinator: ProfileFlowCoordinator

    // MARK: - Initializers
    
    init(window: UIWindow) {
        self.window = window
        searchFlowCoordinator = SearchFlowCoordinator()
        homeFlowCoordinator = HomeFlowCoordinator()
        profileFlowCoordinator = ProfileFlowCoordinator()
        
        super.init()
    }

    func initializeApp() {
        let tabbarViewController = UITabBarController()
        
        let homeViewController = homeFlowCoordinator.rootViewController
        let searchViewController = searchFlowCoordinator.rootViewController
        let profileViewController = profileFlowCoordinator.rootViewController
        
        tabbarViewController.viewControllers = [
            homeViewController,
            searchViewController,
            profileViewController
        ]
        
        window.rootViewController = tabbarViewController
        window.makeKeyAndVisible()
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}
