//
//  Moview.swift
//  NetguruCollegeApp
//


import Foundation

struct Movie: Codable {
    let id : Int
    let title: String
    let voteAverage: Float
    let posterPath: String?
    var posterURL: URL? {
        guard let posterPath = posterPath else {
            return nil
        }

        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }

    let description: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case description = "overview"
    }
}

struct HomeModel: Codable {
    let page: Int
    let results: [Movie]
}
