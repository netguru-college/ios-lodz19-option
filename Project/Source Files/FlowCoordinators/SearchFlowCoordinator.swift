//
//  SearchFlowCoordinator.swift
//  NetguruCollegeApp
//


import UIKit

class SearchFlowCoordinator: FlowCoordinator {

    override init() {
        super.init()
        
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        rootViewController = navigationController
    }
    
}
