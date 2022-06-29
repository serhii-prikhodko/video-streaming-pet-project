//
//  MoviePreviewCell.swift
//  netflix_project
//
//  Created by Serhiy Prikhodko on 24.06.2022.
//

import Kingfisher
import SwiftUI

struct MoviePreviewCell: View {
    
    var movie: Movie
    let colors: [Color] = [.red, .gray, .green, .blue, .yellow, .white, .orange]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(colors.randomElement())
            )
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -20)
                .frame(height: 65)
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewCell(movie: exampleMovie1)
                .frame(width: 165, height: 50)
        }
    }
}
