//
//  DetailView.swift
//  NetguruCollegeApp
//


import UIKit

class DetailView: UIView {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieFavouriteButton: UIButton!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieWatchedButton: UIButton!
    @IBOutlet weak var movieDescriptionLabel: UILabel!

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "DetailView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        movieTitleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        movieFavouriteButton.layer.cornerRadius = 5
        movieWatchedButton.layer.cornerRadius = 5
    }
}
