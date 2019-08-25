//
//  HomeViewModel.swift
//  NetguruCollegeApp
//

import UIKit
import Kingfisher

class HomeViewModel: NSObject {
    private let apiService: APIService
    var popularMovies = [Movie]()

    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getPopularMovies(success: @escaping () -> Void) {
        apiService.fetchHomeView(success: { [weak self] (movies) in
            self?.popularMovies = movies
            success()
        }) { (error) in
            print(error as Any)
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
        return popularMovies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = popularMovies[indexPath.row]
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as! MovieCollectionViewCell

        if let posterURL = movie.posterURL {
            movieCell.posterImageTask = movieCell.moviePosterImageView.kf.setImage(with: posterURL)
        }

        return movieCell
    }
}
