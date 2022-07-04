//
//  HomeView.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 18.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    var vm = HomeVM()
    var screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack {
                    TopRowButtons(topRowSelection: $topRowSelection,
                                  homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection,
                                  showTopRowSelection: $showTopRowSelection)
                        .zIndex(0)
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -100)
                        .zIndex(-1)
                    
                    MoviePreviewRow(movies: exampleMovies,
                                    showPreviewFullScreen: $showPreviewFullScreen,
                                    previewStartingIndex: $previewStartingIndex)
                    
                    HomeStack(vm: vm,
                              topRowSelection: topRowSelection,
                              selectedGenre: homeGenre,
                              movieDetailToShow: $movieDetailToShow,
                              showPreviewFullScreen: $showPreviewFullScreen,
                              previewStartingIndex: $previewStartingIndex)
                }
            }
            if let movieDetailToShow = movieDetailToShow {
                MovieDetail(movie: movieDetailToShow, movieDetailsToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40) {
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            })
                            
                        }
                        Spacer()
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                            .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40) {
                        Spacer()
                        ScrollView {
                            ForEach(vm.allGenres, id: \.self) { genre in
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if genre == homeGenre {
                                        Text("\(genre.rawValue)")
                                            .bold()
                                    } else {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.gray)
                                    }
                                })
                                    .padding(.bottom, 40)
                                
                            }
                        }
                        Spacer()
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                            .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showPreviewFullScreen: .constant(false), previewStartingIndex: .constant(0))
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40)
                })
                    .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                    .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                    .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                    .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .tvShows, .movies, .myList:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40)
                })
                    .buttonStyle(PlainButtonStyle())
                Spacer()
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 8))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                        .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                        .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}
