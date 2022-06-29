//
//  PreviewView.swift
//  netflix_project
//
//  Created by Serhiy Prikhodko on 27.06.2022.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var vm: PreviewVM
    
    var playVideo: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerPlayerView(videoURL: vm.movie.trailers.first?.videoURL,
                              playVideo: .constant(playVideo))
            .aspectRatio(contentMode: .fit)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(vm.movie.name)
                            .foregroundColor(vm.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                    })
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<vm.movie.categories.count, id: \.self) { catIndex in
                        let category = vm.movie.categories[catIndex]
                        Text(category)
                            .font(.footnote)
                        if catIndex < vm.movie.categories.count - 1 {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 3))
                        }
                    }
                    .foregroundColor(vm.movie.accentColor)
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List",
                                        isOnImage: "checkmark",
                                        isOffImage: "plus", isOn: true,
                                        accentColor: vm.movie.accentColor,
                                        action: {
                        //
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        //
                    }, label: {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .foregroundColor(vm.movie.accentColor)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(vm.movie.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info",
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        isOn: true,
                                        accentColor: vm.movie.accentColor) {
                        //
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
                .padding(.bottom, 48)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
