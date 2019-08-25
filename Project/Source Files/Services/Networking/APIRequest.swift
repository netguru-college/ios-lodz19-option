//
//  APIRequest.swift
//  NetguruCollegeApp
//

protocol APIRequest {
    var path: String { get }
    var method: APIMethod { get }
    var parameters: [String: String]? { get }
}

extension APIRequest {
    var parameters: [String: String]? { return nil }
}
