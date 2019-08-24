//
//  SearchViewCell.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var labelContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    /// Default reuse identifier to use for this cell class
    static let searchViewCellReuseIdentifier = "SearchViewCell"
}
