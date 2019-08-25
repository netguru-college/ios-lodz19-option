//
//  HomeFlowCoordinator.swift
//  NetguruCollegeApp
//


import UIKit

class HomeFlowCoordinator: FlowCoordinator {
    override init() {
        super.init()
        let viewController = HomeViewController(delagate: self)
        rootViewController = UINavigationController(rootViewController: viewController)
    }
}

extension HomeFlowCoordinator: HomeViewControllerDelegate {

    func didSelectMovie() {
        let detailViewController = DetailViewController(
            detailViewModel: DetailViewModel()
        )
        
        rootViewController.show(detailViewController, sender: nil)
    }
}
