//
//  SearchViewModel.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchViewModel {

    enum State {
        case empty
        case noSearchResults
        case populated([Movie])
    }

    var state = State.empty {
        didSet {
            switch self.state {
            case .empty:
                movieArray = []
            case .populated(let movies):
                movieArray = movies
            default:
                break
            }
        }
    }
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
    func searchMovieByTitle(_ title: String, pageNumber: Int = 1, completion: @escaping (Error?) -> Void) {
        apiService.fetchSearchResults(containing: title, pageNumber: String(pageNumber), success: { [weak self] (movies) in
            if movies.isEmpty == false {
                self?.state = .populated(movies)
            } else {
                self?.state = .empty
            }
            completion(nil)
        }) { (error) in
            completion(error)
        }
    }
}
