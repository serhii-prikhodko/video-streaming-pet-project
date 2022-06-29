//
//  GlobalHelpers.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 18.01.2022.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/100")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/101")!
let exampleImageURL3 = URL(string: "https://picsum.photos/301/100")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleVideoURL
}


let exampleTrailer1 = Trailer(name: "Season 1 trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer2 = Trailer(name: "Season 2 trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer3 = Trailer(name: "Season 3 trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "Dark",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
                          episodes: allExampleEpisodes,
                          promotionHeadline: "New episodes coming soon",
                          trailers: exampleTrailers)
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Office",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2004,
                          rating: "TV-MA",
                          numberOfSeasons: 9,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Don't look up",
                          thumbnailURL: URL(string: "https://picsum.photos/201/300")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2021,
                          rating: "TV-MA",
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)
let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Rambo",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 1981,
                          rating: "TV-MA",
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Breacking bad",
                          thumbnailURL: URL(string: "https://picsum.photos/201/301")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2007,
                          rating: "TV-MA",
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailers)
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "Fargo",
                          thumbnailURL: URL(string: "https://picsum.photos/201/302")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2014,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [],
                          promotionHeadline: "Watch season 3 now",
                          trailers: exampleTrailers)
let exampleMovie7 = Movie(id: UUID().uuidString,
                          name: "Fargo",
                          thumbnailURL: URL(string: "https://picsum.photos/201/302")!,
                          categoies: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
                          year: 2014,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odar,Jantje Friese",
                          cast: "Louis Hofmann,Oliver Masucci,Jördis Triebel",
                          moreLikeThisMovies: [],
                          promotionHeadline: "Watch season 3 now",
                          trailers: exampleTrailers)

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Secrets", description: "In 2019, a local boy's disappearance stokes fear in the residents of Winden, a small German town with a strange and tragic history.", season: 1, episode: 1)

// Episodes, Season 1
let episode1 = Episode(name: "Episode 1",
                       season: 1,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/300/100",
                       description: "Episode 1 description",
                       length: 23,
                       videoURL: exampleVideoURL)
let episode2 = Episode(name: "Episode 2",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/300/101",
                       description: "Episode 2 description",
                       length: 25,
                       videoURL: exampleVideoURL)
let episode3 = Episode(name: "Episode 3",
                       season: 1,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/301/100",
                       description: "Episode 3 description",
                       length: 22,
                       videoURL: exampleVideoURL)

// Episodes, Season 2
let episode4 = Episode(name: "Season 2. Episode 1",
                       season: 2,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/300/100",
                       description: "Episode 1 description",
                       length: 23,
                       videoURL: exampleVideoURL)
let episode5 = Episode(name: "Season 2. Episode 2",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/300/101",
                       description: "Episode 2 description",
                       length: 25,
                       videoURL: exampleVideoURL)
let episode6 = Episode(name: "Season 2. Episode 3",
                       season: 2,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/301/100",
                       description: "Episode 3 description",
                       length: 22,
                       videoURL: exampleVideoURL)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]

// Extensions
extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)],
                                                     startPoint: .top,
                                                     endPoint: .bottom)
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        
        return size.width
    }
}
