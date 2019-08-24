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
		customView.tableView.delegate = self
		customView.tableView.dataSource = self
		customView.tableView.rowHeight = 150
	}
	private func setupVC() {
		navigationItem.title = "Search"
	}
}

extension SearchViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension SearchViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: SearchViewCell.searchViewCellReuseIdentifier) as! SearchViewCell
		cell.titleLabel.text = "Test Movie Title 1"
		cell.subtitleLabel.text = "Some sublabel"
		return cell
	}
}
