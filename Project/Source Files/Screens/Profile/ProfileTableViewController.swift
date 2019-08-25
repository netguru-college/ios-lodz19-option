//
//  ProfileViewController.swift
//  NetguruCollegeApp
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    // MARK: - Variables
    
//    private var profileViewModel = ProfileViewModel()
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        
        //        tableView.dataSource = profileViewModel
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
            fatalError("Invalid Cell")
        }
        
        cell.movieTitle.text = "Fast & Furious"
        
        return cell 
    }
    
}
