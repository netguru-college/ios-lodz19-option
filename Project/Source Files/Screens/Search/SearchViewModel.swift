//
//  SearchViewModel.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchViewModel {

    private let apiService: APIService
    var movieArray: [Movie] = []

    init(apiService: APIService) {
        self.apiService = apiService
    }

    /// Sends an API request to search for a movie with a given title
    ///
    /// - Parameters:
    ///   - title: Movie title to search for
    ///   - pageNumber: Page number of returned results, default is 1
    func searchMovieByTitle(_ title: String, pageNumber: Int = 1, completion: @escaping ([Movie]?, Error?) -> Void) {
        apiService.fetchSearchResults(containing: title, pageNumber: String(pageNumber), success: { (movies) in
            completion(movies, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}
