//
//  TrailerPlayerView.swift
//  netflix_project
//
//  Created by Serhiy Prikhodko on 27.06.2022.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if let videoURL = videoURL {
            VideoPlayer(url: videoURL, play: $playVideo)
        } else {
            Text("Could not load the video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(playVideo: .constant(true))
    }
}
