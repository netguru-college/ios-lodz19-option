//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    
    // MARK: - Properties
    
    private let window: UIWindow

    private let appDependencies: AppDependencies
    private var homeFlowCoordinator: HomeFlowCoordinator
    private var searchFlowCoordinator: SearchFlowCoordinator
    private var profileFlowCoordinator: ProfileFlowCoordinator

    // MARK: - Initializers
    
    init(window: UIWindow) {
        self.window = window
        appDependencies = AppDependencies()
        searchFlowCoordinator = SearchFlowCoordinator(apiService: appDependencies.apiService)
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
