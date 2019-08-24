//
//  SearchTabViewController.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewController: UIViewController {

	required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	private var customView: SearchView {
		return view as! SearchView
	}
	override func loadView() {
		view = SearchView.instanceFromNib()
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		setupVC()
    }
	private func setupTableView() {
		customView.tableView.register(
			UINib(nibName: "SearchViewCell", bundle: nil),
			forCellReuseIdentifier: SearchViewCell.searchViewCellReuseIdentifier)
	}
	private func setupVC() {
		navigationItem.title = "Search"
	}
}
