//
//  SearchViewCell.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewCell: UITableViewCell {

	@IBOutlet var posterImageView: UIImageView!
	@IBOutlet var labelContainerView: UIView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var subtitleLabel: UILabel!
	/// Default reuse identifier to use for this cell class
	static let searchViewCellReuseIdentifier = "SearchViewCell"
	override func awakeFromNib() {
        super.awakeFromNib()
    }
}
