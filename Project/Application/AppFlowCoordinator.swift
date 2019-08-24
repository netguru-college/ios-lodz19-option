//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func initializeApp() {
        let viewController = HomeViewController(delegate: self)
        rootViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

extension AppFlowCoordinator: HomeViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}
