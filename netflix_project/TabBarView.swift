//
//  TabBarView.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 28.03.2022.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            ComingSoon()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Coming soon")
                }.tag(2)
            DownloadsView()
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }.tag(3)
            Text("More")
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("More")
                }.tag(4)
        }
        .accentColor(.white)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
