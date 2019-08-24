//
//  HomeViewController.swift
//  NetguruCollegeApp
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Constants
    
    private struct Constants {
        static let homeString = "Home"
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.green
        
        tabBarItem.title = Constants.homeString
        tabBarItem.image = UIImage(named: Constants.homeString)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
