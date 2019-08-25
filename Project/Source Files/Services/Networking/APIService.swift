//
//  Service.swift
//  NetguruCollegeApp
//


import UIKit


class APIService {

    private let apiClient = APIClient()
    
    func fetchHomeView(success: @escaping ([Movie]) -> Void, failure: @escaping (Error?) -> Void) {
        apiClient.sendRequestAndDecode(
            request: HomeRequest(),
            success: { (model: HomeModel) in
                success(model.results)
        }, failure: failure)
    }

    func fetchSearchResults(containing title: String, pageNumber: String, success: @escaping ([Movie]) -> Void, failure: @escaping (Error?) -> Void) {
        
        let searchRequest = SearchMovieRequest(searchQuery: title, pageNumber: pageNumber)

        apiClient.sendRequestAndDecode(request: searchRequest, success: { (model: HomeModel) in
            success(model.results)
        }, failure: failure)
    }
}


