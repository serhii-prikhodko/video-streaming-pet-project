//
//  PopularMovieView.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 08.04.2022.
//

import Kingfisher
import SwiftUI

struct PopularMovieView: View {
    
    var movie: Movie
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    // Play movie
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                    .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture(perform: {
                self.movieDetailToShow = movie
            })
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}
