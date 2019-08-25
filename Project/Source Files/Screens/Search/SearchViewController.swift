//
//  SearchTabViewController.swift
//  NetguruCollegeApp
//

import UIKit

class SearchViewController: UIViewController {

    private var customView: SearchView {
        return view as! SearchView
	}
    private var searchController = UISearchController(searchResultsController: nil)
    private var searchScopeButtonTitles = ["Title", "Genre"]
    private let searchViewModel: SearchViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}

    init(searchViewModel: SearchViewModel) {
        self.searchViewModel = searchViewModel
        super.init(nibName: nil, bundle: nil)

        tabBarItem.title = "Search"
        tabBarItem.image = UIImage(named: "Search")
    }

    override func loadView() {
        view = SearchView.instanceFromNib()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchViewController()
        setupSearchController()
    }

    private func setupTableView() {
        customView.tableView.register(
            UINib(nibName: "SearchViewCell", bundle: nil),
            forCellReuseIdentifier: SearchViewCell.searchViewCellReuseIdentifier
        )
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

    private func setupSearchViewController() {
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
        return 20 //TODO: change this when model is ready
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchViewCell.searchViewCellReuseIdentifier) as! SearchViewCell
        cell.titleLabel.text = "Test Movie Title \(indexPath.row + 1)"	//TODO: change this when model is ready
        cell.subtitleLabel.text = "Some sublabel"	//TODO: change this when model is ready
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("New search scope is \(searchScopeButtonTitles[selectedScope])")	///TODO: change this when model is ready
    }
}
