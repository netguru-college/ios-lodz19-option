//
//  HomeViewController.swift
//  NetguruCollegeApp
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.green
        
        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(named: "Home")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
