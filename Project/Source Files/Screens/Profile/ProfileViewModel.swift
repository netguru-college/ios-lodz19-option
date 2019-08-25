//
//  ProfileViewModel.swift
//  NetguruCollegeApp
//

import UIKit

class ProfileViewModel: NSObject {
    
    func setupTableViewForController(tableView: UITableView?) {
        
        guard let tableView = tableView else {
            fatalError("Invalid TableView")
        }
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.rowHeight = 150
    }
}

extension ProfileViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
            fatalError("Invalid Cell")
        }
        
        cell.movieImage.image = UIImage(named: "defaultPoster")
        cell.movieTitle.text = "Baby Driver"
        cell.movieGenre.text = "Action"
        cell.movieYear.text = "2017"
        cell.movieRate.text = "8.2"
        
        return cell
    }
}
