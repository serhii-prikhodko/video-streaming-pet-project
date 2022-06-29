//
//  PreviewVM.swift
//  netflix_project
//
//  Created by Serhiy Prikhodko on 27.06.2022.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
