//
//  ComingSoonVM.swift
//  netflix_project
//
//  Created by Serhiy Prikhodko on 23.06.2022.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
