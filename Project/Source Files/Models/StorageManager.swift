//
//  StorageManager.swift
//  NetguruCollegeApp
//

import Foundation

struct StorageManager: StorageManagerProtocol {
    
    func getMovies() throws ->  [Movie] {
        let appDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let fileURL = appDirectory.appendingPathComponent("movies")
        
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return []
        }
        
        let data = try Data.init(contentsOf: fileURL)
        let movies: [Movie] = try JSONDecoder().decode([Movie].self, from: data)
        
        return movies
    }
    
    func add(movie: Movie) throws {
        var movies = try getMovies()
        movies.append(movie)
        
        let appDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = appDirectory.appendingPathComponent("movies")
        let dataRepresentation = try JSONEncoder().encode(movies)
        try dataRepresentation.write(to: fileURL, options: .atomic)
    }
    
    func remove(movie: Movie) throws {
        do {
            var movies = try getMovies()
            movies = movies.filter {$0.id != movie.id }
            
            let appDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = appDirectory.appendingPathComponent("movies")
            let dataRepresentation = try JSONEncoder().encode(movies)
            try dataRepresentation.write(to: fileURL, options: .atomic)
        } catch let error {
            throw error
        }
    }
    
    func removeAll() throws {
        do {
            let appDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = appDirectory.appendingPathComponent("movies")
            let dataRepresentation = try JSONEncoder().encode([Movie]())
            try dataRepresentation.write(to: fileURL, options: .atomic)
        } catch let error {
            throw error
        }
    }
}
