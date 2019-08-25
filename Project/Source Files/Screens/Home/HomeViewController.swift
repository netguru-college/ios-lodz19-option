//
//  HelloWorldViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didSelectMovie(movie: Movie)
}

class HomeViewController: UIViewController {
    
    private weak var delagate: HomeViewControllerDelegate?
    private let homeViewModel: HomeViewModel
    private var customView: HomeView {
        return view as! HomeView
    }

    // MARK: - Functions

    init(delagate: HomeViewControllerDelegate, homeViewModel: HomeViewModel) {
        self.delagate = delagate
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)

        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(named: "Home")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = HomeView.instanceFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Discover"

        customView.moviesCollectionView.delegate = self
        homeViewModel.setup(collectionView: customView.moviesCollectionView)
        homeViewModel.getPopularMovies { [weak self] in
            self?.customView.moviesCollectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        
        return CGSize(width: (width * 0.42), height: 240)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = homeViewModel.popularMovies[indexPath.row]
        delagate?.didSelectMovie(movie: movie)
    }
}



