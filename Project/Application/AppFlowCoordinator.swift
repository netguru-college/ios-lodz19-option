//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    // MARK: - Constants
    
    private struct Constants {
        static let homeString = "Home"
        static let searchString = "Search"
        static let profileString = "Profile"
    }
    
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
        
        homeViewController.tabBarItem.title = Constants.homeString
        searchViewController.tabBarItem.title = Constants.searchString
        profileViewController.tabBarItem.title = Constants.profileString
        
        homeViewController.tabBarItem.image = UIImage(named: Constants.homeString)
        searchViewController.tabBarItem.image = UIImage(named: Constants.searchString)
        profileViewController.tabBarItem.image = UIImage(named: Constants.profileString)
        
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
