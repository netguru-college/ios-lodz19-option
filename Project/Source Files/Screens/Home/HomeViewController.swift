//
//  HelloWorldViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didSelectNextButton()
}

class HomeViewController: UIViewController {
    private var homeViewModel = HomeViewModel()
    private var customView: HomeView {
        return view as! HomeView
    }

    private weak var delegate: HomeViewControllerDelegate?

    // MARK: - Functions

    init(delegate: HomeViewControllerDelegate?) {
        self.delegate = delegate
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

    @objc func nextAction() {
        delegate?.didSelectNextButton()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        
        return CGSize(width: (width * 0.42), height: 240)
    }
}
