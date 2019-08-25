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
