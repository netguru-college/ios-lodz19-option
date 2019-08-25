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
        description: """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            Nullam ultricies fermentum ex et egestas. Sed vitae euismod lacus.
            Nullam ut sollicitudin
            sem. Nunc nec dapibus metus.
            In id semper velit, non mollis ante. Nam eu mi imperdiet
            dictum neque in, blandit libero.
            Donec blandit in turpis eu egestas.
            In id semper velit, non mollis ante. Nam eu mi imperdiet
            dictum neque in, blandit libero.
            Donec blandit in turpis eu egestas.
"""
    )

    func setupView(view: DetailView) {
        view.movieTitleLabel.text = movie.title
        view.moviePosterImageView.kf.setImage(with: URL(string: movie.posterPath))
        view.movieRating.text = "Rating: \(movie.voteAverage)"
        view.movieDescriptionLabel.text = movie.description
    }
}
