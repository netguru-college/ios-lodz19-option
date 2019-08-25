//
//  SearchFlowCoordinator.swift
//  NetguruCollegeApp
//


import UIKit

class SearchFlowCoordinator: FlowCoordinator {

    init(apiService: APIService) {
        super.init()
        let searchViewController = SearchViewController(searchViewModel: SearchViewModel(apiService: apiService))
        let navigationController = UINavigationController(rootViewController: searchViewController)
        rootViewController = navigationController
    }
}
