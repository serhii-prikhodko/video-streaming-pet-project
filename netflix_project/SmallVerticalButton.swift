//
//  SmallVerticalButton.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 28.01.2022.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool
    var imageName: String {
        return isOn ? isOnImage : isOffImage
    }
    var accentColor: Color?
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Image(systemName: imageName)
                Text(text)
                    .font(.footnote)
                    .bold()
            }
            .foregroundColor(accentColor ?? .white)
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SmallVerticalButton(text: "My List",
                                isOnImage: "checkmark",
                                isOffImage: "plus",
                                isOn: true,
                                accentColor: .white) {
                print("Tapped")
            }
        }
    }
}
