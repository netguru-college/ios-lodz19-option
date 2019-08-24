//
//  Service.swift
//  NetguruCollegeApp
//


import UIKit

class Service {
    
//    static let shared = Service()
    private let apiClient = APIClient()
    
    func fetchHomeView() {
        
//        apiClient.sendRequest(request: HomeRequest(), success: {
//            model in
//        })
//        {
//            error in
//
//        }

        apiClient.sendRequest(request: HomeRequest, success: { () in
            <#code#>
        }, failure: <#T##(Error?) -> Void#>)
        
        
        
        let urlString = "https://api.themoviedb.org/3//discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22?"

    
        guard let url = URL(string: urlString) else {return}
        
        // Fetching data
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//        apiClient.session.dataTask(with: url, completionHandler: data, resp, err) in
            // Failed
            if let err = err {
                print("Failed to fetch Home Views :", err)
                return
            }
            
            // Succed
            guard let data = data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(HomeModel.self, from: data)
                print("Results: ", searchResult)
            } catch let jsonErr {
                print("Failed to decode json: ", jsonErr)
            }
        }.resume() // resume fires off the request
    }
}

struct HomeRequest: APIRequest {
//    var path: String = "/search/cos"
    var path: String = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc?api_key=a00875199e7f742f3432f6d12ca3b4d1"
    var method: APIMethod = .get
    var parameters: [String : String] = [
        "sort_by": "popularity.desc"
    ]
}


// Model
struct HomeModel: Decodable {
    let page: String
    let results: Results
}

struct Results: Decodable {
//    let id : String
    let title: String
    let vote_average: String
    let backdrop_path: String
    let overview: String
}
