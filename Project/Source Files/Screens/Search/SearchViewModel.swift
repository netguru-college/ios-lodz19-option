//
//  SearchViewModel.swift
//  NetguruCollegeApp
//


import Foundation

final class SearchViewModel {

    private let apiService: APIService

    init(apiService: APIService) {
        self.apiService = apiService
    }

    /// Sends an API request to search for a movie with a given title
    ///
    /// - Parameters:
    ///   - title: Movie title to search for
    ///   - pageNumber: Page number of returned results, default is 1
    func searchMovieByTitle(_ title: String, pageNumber: Int = 1) {
        apiService.fetchSearchResults(containing: title, pageNumber: String(pageNumber), success: { (movies) in
            print(movies)   //TODO: connect with UI
        }) { (error) in
            print(error)    //TODO: connect with UI
        }
    }
}
