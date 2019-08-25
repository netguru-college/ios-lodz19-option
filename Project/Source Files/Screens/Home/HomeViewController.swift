//
//  HelloWorldViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didSelectMovie()
}

class HomeViewController: UIViewController {

    private weak var delagate: HomeViewControllerDelegate?
    private var homeViewModel = HomeViewModel()
    private var customView: HomeView {
        return view as! HomeView
    }

    // MARK: - Functions

    init(delagate: HomeViewControllerDelegate) {
        self.delagate = delagate
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
        title = "Discovery"

        customView.moviesCollectionView.delegate = self
        homeViewModel.setup(collectionView: customView.moviesCollectionView)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        
        return CGSize(width: (width * 0.42), height: 240)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delagate?.didSelectMovie()
    }
}



