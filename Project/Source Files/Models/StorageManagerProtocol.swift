//
//  StorageManager.swift
//  NetguruCollegeApp
//


import Foundation

protocol StorageManagerProtocol {
    
    func getMovies() throws -> [Movie]
    func add(movie: Movie) throws
    func remove(movie: Movie) throws
    func removeAll() throws
}

