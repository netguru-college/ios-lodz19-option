//
//  SearchViewController.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewController: UIViewController {
    
    
    // MARK: - Constants
    
    private struct Constants {
        static let searchString = "Search"
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.blue
        
        tabBarItem.title = Constants.searchString
        tabBarItem.image = UIImage(named: Constants.searchString)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
