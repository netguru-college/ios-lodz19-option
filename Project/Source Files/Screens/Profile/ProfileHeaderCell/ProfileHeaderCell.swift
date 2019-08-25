//
//  ProfileHeaderCell.swift
//  NetguruCollegeApp
//


import UIKit

class ProfileHeaderCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var watchedMoviesCountLabel: UILabel!
    @IBOutlet var favoriteMoviesCountLabel: UILabel!
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
