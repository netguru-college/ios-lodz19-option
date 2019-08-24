//
//  ProfileViewController.swift
//  NetguruCollegeApp
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    private struct Constants {
        static let homeString = "Profile"
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.yellow
        
        profileViewController.tabBarItem.title = Constants.profileString
        profileViewController.tabBarItem.image = UIImage(named: Constants.profileString)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
