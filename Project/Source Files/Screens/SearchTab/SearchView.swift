//
//  SearchView.swift
//  NetguruCollegeApp
//

import UIKit

class SearchView: UIView {

	@IBOutlet var tableView: UITableView!
	class func instanceFromNib() -> UIView {
		return UINib(nibName: "SearchView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
	}
}
