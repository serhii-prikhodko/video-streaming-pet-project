//
//  SearchView.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 07.04.2022.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchVM()
    @State private var searchText = ""
    @State var movieDetailsToShow: Movie? = nil
    
    var body: some View {
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularView(movies: vm.popularMovies, movieDetailToShow: $movieDetailsToShow)
                    }
                    if vm.viewState == .empty {
                        Text("Your search did not have nay results")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        VStack {
                            HStack {
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 15)
                                Spacer()
                            }
                            SearchResultsGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailsToShow)
                        }
                    }
                }
                
                Spacer()
            }
            if let movieDetailsToShow = movieDetailsToShow {
                MovieDetail(movie: movieDetailsToShow, movieDetailsToShow: $movieDetailsToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularView: View {
    
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 15)
                Spacer()
            }
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
