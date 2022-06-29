//
//  MovieLikeThis.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 22.02.2022.
//

import SwiftUI

struct MovieLikeThis: View {
    
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<movies.count) { index in
                    StandartHomeMovie(movie: movies[index])
                }
            }
        }
    }
}

struct MovieLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MovieLikeThis(movies: exampleMovies)
    }
}
