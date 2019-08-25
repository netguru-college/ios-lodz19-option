//
//  SearchTabViewController.swift
//  NetguruCollegeApp
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    enum State {
        case empty
        case noSearchResults
        case populated([Movie])
    }

    private var state = State.empty {
        didSet {
            switch self.state {
            case .empty:
                searchViewModel.movieArray = []
            case .populated(let movies):
                searchViewModel.movieArray = movies
            default:
                break
            }
            DispatchQueue.main.async {
                self.setTableViewBackground()
                let range = Range(uncheckedBounds: (0, self.tableView.numberOfSections))
                let indexSet = IndexSet(integersIn: range)
                self.tableView.reloadSections(indexSet, with: .automatic)
            }
        }
    }

    private var customView: SearchView {
        return view as! SearchView
    }
    private var tableView: UITableView {
        return customView.tableView
    }
    private var errorBackgroundView: ErrorBackgroundView?
    private var searchController = UISearchController(searchResultsController: nil)
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
        setTableViewBackground()
    }

    private func setupTableView() {
        tableView.register(
            UINib(nibName: "SearchViewCell", bundle: nil),
            forCellReuseIdentifier: SearchViewCell.searchViewCellReuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
    }

    private func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "")
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    private func setupSearchViewController() {
        navigationItem.title = "Search"
        definesPresentationContext = true
    }

    private func setTableViewBackground() {

        func setErrorBackgroundView(title: String = "Oops!", message: String) {
            errorBackgroundView?.removeFromSuperview()
            errorBackgroundView = nil
            errorBackgroundView = ErrorBackgroundView()
            tableView.addSubview(errorBackgroundView!)
            tableView.separatorStyle = .none
            errorBackgroundView?.configureConstraints()
            errorBackgroundView?.errorDescription.text = message
            errorBackgroundView?.errorTitle.text = title
        }

        func removeErrorBackgroundView() {
            tableView.subviews.forEach( { if $0 is ErrorBackgroundView { $0.removeFromSuperview() } } )
            errorBackgroundView = nil
        }

        func setForEmpty() {
            removeErrorBackgroundView()
            tableView.separatorStyle = .none
            setErrorBackgroundView(title: "", message: "Use the search bar to find a movie")
        }

        func setForNoSearchResults() {
            setErrorBackgroundView(message: "No movies found!")
        }

        func setForPopulated() {
            removeErrorBackgroundView()
            tableView.separatorStyle = .singleLine
        }

        switch state {
        case .empty:
            setForEmpty()
        case .populated:
            setForPopulated()
        case .noSearchResults:
            setForNoSearchResults()
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //TODO: go to detail view
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.movieArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchViewCell.searchViewCellReuseIdentifier) as? SearchViewCell else {
                fatalError("Can't cast tableView cell to SearchViewCell")
        }
        cell.posterImageView.image = nil
        let movie = searchViewModel.movieArray[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.subtitleLabel.text = String(searchViewModel.movieArray[indexPath.row].voteAverage)
        cell.posterImageView.kf.setImage(with: movie.posterURL)
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.isActive == false {
            state = .empty
        }
        guard let searchQuery = searchController.searchBar.text,
            searchController.searchBar.text?.isEmpty == false else {
                return
        }
        searchViewModel.searchMovieByTitle(searchQuery) { [weak self] (movies, error) in
            if let movies = movies {
                if movies.isEmpty == false {
                    self?.state = .populated(movies)
                } else {
                    self?.state = .noSearchResults
                }
            } else {
                self?.state = .noSearchResults
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            state = .empty
        }
    }
}
