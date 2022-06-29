//
//  StandartHomeMovie.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 18.01.2022.
//

import Kingfisher
import SwiftUI

struct StandartHomeMovie: View {
    var movie: Movie
    var body: some View {
        GeometryReader { proxy in
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

struct StandartHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandartHomeMovie(movie: exampleMovie1)
    }
}
