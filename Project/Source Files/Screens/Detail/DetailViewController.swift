//
//  DetailViewController.swift
//  NetguruCollegeApp
//


import UIKit

class DetailViewController: UIViewController {
    private var detailViewModel: DetailViewModel
    private var customView: DetailView {
        return view as! DetailView
    }

    override func loadView() {
        view = DetailView.instanceFromNib()
    }

    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        detailViewModel.setupView(view: customView)
        title = detailViewModel.movie.title
    }
}
