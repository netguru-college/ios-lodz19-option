//
//  Service.swift
//  NetguruCollegeApp
//


import UIKit

class Service {
    private let apiClient = APIClient()
    
    func fetchHomeView(success: @escaping ([Movie]) -> Void, failure: @escaping (Error?) -> Void) {
        apiClient.sendRequestAndDecode(
            request: HomeRequest(),
            success: { (model: HomeModel) in
                success(model.results)
        }, failure: failure)
    }
}

