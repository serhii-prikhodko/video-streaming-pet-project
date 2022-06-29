//
//  ComingSoon.swift
//  netflix_project
//
//  Created by Serhiy Prikhodko on 22.06.2022.
//

import SwiftUI

struct ComingSoon: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var hideNavBar = true
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject private var vm = ComingSoonVM()
    
    private func updateActiveIndex(fromScroll scroll: CGFloat) {
        let navBarHeight: CGFloat = 105
        let rowHeight: CGFloat = 410
        if scroll < navBarHeight {
            activeIndex = 0
        } else {
            let removeNavBarHeight = scroll - navBarHeight
            let active = Int(removeNavBarHeight / rowHeight) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        //        NavigationView {
        Group {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding, content: {
                    LazyVStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        ForEach(movies, id: \.offset) { index, movie in
                            ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                .frame(height: 400)
                                .overlay(
                                    Group {
                                        index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                    }
                                        .animation(.easeInOut)
                                )
                        }
                    }
                })
                .foregroundColor(.white)
                NavigationLink(destination: Text("Notification List"),
                               isActive: $showNotificationList,
                               label: {
                    EmptyView()
                })
                .navigationTitle("")
                .navigationBarHidden(hideNavBar)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in self.hideNavBar = true })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in self.hideNavBar = true })
            }
        }
        //        }
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
