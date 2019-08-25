//
//  HomeViewModel.swift
//  NetguruCollegeApp
//

import UIKit
import Kingfisher

class HomeViewModel: NSObject {
    private let apiService = Service()

    func getPopularMovies() {
        apiService.fetchHomeView(success: { (movie) in
            print(movie)
        }) { (error) in
            print(error)
        }
    }

    func setup(collectionView: UICollectionView) {
        let customCollectionViewLayout = UICollectionViewFlowLayout()
        customCollectionViewLayout.sectionInset = UIEdgeInsets(top: 20, left: 25, bottom: 25, right: 20)
        customCollectionViewLayout.minimumLineSpacing = 20

        collectionView.collectionViewLayout = customCollectionViewLayout
        collectionView.dataSource = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "movie")
    }
}

extension HomeViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as! MovieCollectionViewCell
        //movieCell.moviePosterImageView.kf.setImage(with: moviePosterURL)
        return movieCell
    }
}
