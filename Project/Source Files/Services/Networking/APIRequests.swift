//
//  APIRequests.swift
//  NetguruCollegeApp
//


import Foundation

struct HomeRequest: APIRequest {
    var path: String = "discover/movie"
    var method: APIMethod = .get
    var parameters: [String : String] = [
        "sort_by": "popularity.desc"
    ]
}

struct SearchMovieRequest: APIRequest {
    var path: String = "search/movie"
    var method: APIMethod = .get

    let searchQuery: String
    let pageNumber: String

    var parameters: [String : String]?

    init(searchQuery: String, pageNumber: String = "1") {
        self.searchQuery = searchQuery
        self.pageNumber = pageNumber
        self.parameters = [
            "query" : searchQuery,
            "page" : pageNumber
        ]
    }
}
