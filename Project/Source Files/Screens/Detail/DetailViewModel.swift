//
//  DetailViewModel.swift
//  NetguruCollegeApp
//


import UIKit
import Kingfisher

class DetailViewModel {
    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    func setupView(view: DetailView) {
        view.movieTitleLabel.text = movie.title
        view.moviePosterImageView.kf.setImage(with: URL(string: movie.posterPath!))
        view.movieRating.text = "Rating: \(movie.voteAverage)"
        view.movieDescriptionLabel.text = movie.description

        if let posterPath = movie.posterPath {
            let url = "https://image.tmdb.org/t/p/w500\(posterPath)"

            view.moviePosterImageView.kf.setImage(with: URL(string: url))
        }
    }
}
