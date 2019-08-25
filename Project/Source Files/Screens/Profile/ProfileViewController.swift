//
//  ProfileViewController.swift
//  NetguruCollegeApp
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Variables
    
    private var profileViewModel = ProfileViewModel()
    private var customView: ProfileView {
        return view as! ProfileView
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)

        tabBarItem.title = "Profile"
        tabBarItem.image = UIImage(named: "Profile")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        profileViewModel.setupTableViewForController(tableView: customView.tableView)
        customView.tableView.dataSource = profileViewModel
        customView.tableView.delegate = self
    }

    override func loadView() {
        view = ProfileView.instanceFromNib()
    }
}
