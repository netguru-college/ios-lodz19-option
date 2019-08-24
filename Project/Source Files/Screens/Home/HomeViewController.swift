//
//  HelloWorldViewController.swift
//  NetguruCollegeApp
//

import UIKit

class HomeViewController: UIViewController {
    private var homeViewModel = HomeViewModel()
    private var customView: HomeView {
        return view as! HomeView
    }

    // MARK: - Functions

    init() {
        super.init(nibName: nil, bundle: nil)
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
}
