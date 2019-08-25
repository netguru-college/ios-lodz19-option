//
//  HomeFlowCoordinator.swift
//  NetguruCollegeApp
//


import UIKit

class HomeFlowCoordinator: FlowCoordinator {

    init(apiService: APIService) {
        super.init()
        let viewController = HomeViewController(delagate: self, homeViewModel: HomeViewModel(apiService: apiService))
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
