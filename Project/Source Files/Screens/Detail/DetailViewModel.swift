//
//  DetailViewModel.swift
//  NetguruCollegeApp
//


import UIKit
import Kingfisher

class DetailViewModel {
    var movie = Movie(
        id: 1,
        title: "Titanic",
        voteAverage: 5.4,
        posterPath: "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",
        description: "Description..."
    )

    func setupView(view: DetailView) {
        view.movieTitleLabel.text = movie.title
        view.moviePosterImageView.kf.setImage(with: URL(string: movie.posterPath!))
        view.movieRating.text = "Rating: \(movie.voteAverage)"
        view.movieDescriptionLabel.text = movie.description

        view.movieTitleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        view.movieFavouriteButton.layer.cornerRadius = 5
        view.movieWatchedButton.layer.cornerRadius = 5
    }
}
