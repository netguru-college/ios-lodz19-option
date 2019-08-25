//
//  SearchViewController.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.blue
        
        tabBarItem.title = "Search"
        tabBarItem.image = UIImage(named: "Search")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
