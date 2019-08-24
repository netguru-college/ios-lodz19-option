//
//  SearchTabViewController.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewController: UIViewController {

	required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	init(searchController: UISearchController = UISearchController(searchResultsController: nil)) {
		self.searchController = searchController
		super.init(nibName: nil, bundle: nil)
	}
	private var customView: SearchView {
		return view as! SearchView
	}
	private var searchController: UISearchController
	private var searchScopeButtonTitles = ["Title", "Genre"]
	override func loadView() {
		view = SearchView.instanceFromNib()
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		setupVC()
		setupSearchController()
    }
	private func setupTableView() {
		customView.tableView.register(
			UINib(nibName: "SearchViewCell", bundle: nil),
			forCellReuseIdentifier: SearchViewCell.searchViewCellReuseIdentifier)
		customView.tableView.delegate = self
		customView.tableView.dataSource = self
		customView.tableView.rowHeight = 150
	}
	private func setupSearchController() {
		navigationItem.searchController = searchController
		searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "")
		navigationItem.hidesSearchBarWhenScrolling = false
		searchController.hidesNavigationBarDuringPresentation = false
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.delegate = self
		searchController.searchBar.scopeButtonTitles = searchScopeButtonTitles
	}
	private func setupVC() {
		navigationItem.title = "Search"
		definesPresentationContext = true
	}
}

extension SearchViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension SearchViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20 //placeholder
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: SearchViewCell.searchViewCellReuseIdentifier) as! SearchViewCell
		cell.titleLabel.text = "Test Movie Title \(indexPath.row + 1)"	//placeholder
		cell.subtitleLabel.text = "Some sublabel"	//placeholder
		return cell
	}
}

extension SearchViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
		print("New search scope is \(searchScopeButtonTitles[selectedScope])")	//placeholder
	}
}
