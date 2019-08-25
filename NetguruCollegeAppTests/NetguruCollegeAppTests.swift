//
//  NetguruCollegeAppTests.swift
//  NetguruCollegeAppTests
//


import XCTest
@testable import NetguruCollegeApp

class NetguruCollegeAppTests: XCTestCase {

    let storageManager: StorageManagerProtocol = StorageManager()
    
    let someMovie = Movie(
        id: 0,
        title: "mov",
        voteAverage: 7.6,
        posterPath: "",
        description: "desc"
    )
    
    let someMovie2 = Movie(
        id: 1,
        title: "mov2",
        voteAverage: 7.6,
        posterPath: "",
        description: "desc"
    )
    
    override func setUp() {
        do {
            try storageManager.removeAll()
        } catch {
            XCTFail("catched fail")
        }
    }
    
    func testIfInitialArrayWouldBeEmpty() {
        do {
            let movies = try storageManager.getMovies()
            XCTAssertEqual(movies.count, 0)
        } catch {
            XCTFail("catched fail")
        }
    }
    
    func testIfRemoveAllIsWorking() {
        do {
            
            try storageManager.add(movie: someMovie)
            try storageManager.add(movie: someMovie2)
            
            let movies = try storageManager.getMovies()
            
            XCTAssertEqual(movies.count, 2)
            
            try storageManager.removeAll()
            
            let moviesLater = try storageManager.getMovies()
            
            XCTAssertEqual(moviesLater.count, 0)
        } catch {
            XCTFail("Catched Fail")
        }
    }
    
    func testIfAddingMovieIsWorking() {
        do {
            try storageManager.add(movie: someMovie)
            let movies = try storageManager.getMovies()
            
            XCTAssertEqual(1, movies.count)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testIfSingleDeletionIsWorking() {
        do {
            try storageManager.add(movie: someMovie)
            try storageManager.add(movie: someMovie2)
            try storageManager.remove(movie: someMovie2)
            let movies = try storageManager.getMovies()
            XCTAssertEqual(1, movies.count)
        } catch {
            XCTFail("catched fail")
        }
    }
}
