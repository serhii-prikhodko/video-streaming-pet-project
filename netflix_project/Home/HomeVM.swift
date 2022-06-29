//
//  HomeVM.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 18.01.2022.
//

import Foundation

class HomeVM: ObservableObject {
    
    // String = Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({
            String($0)
        })
    }
    public var allGenres: [HomeGenre] = [.AllGenres, .Comedy, .Horror, .Thriller]

    public func getMovies(forCategory category: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({$0.movieType == .tvShow && $0.genre == genre})
        case .movies:
            return (movies[category] ?? []).filter({$0.movieType == .movie && $0.genre == genre})
        case .myList:
            return movies[category] ?? []
            // TODO: setup My List properly
        }
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies
        movies["New"] = exampleMovies
    }
}
