//
//  Trailer.swift
//  netflix_project
//
//  Created by Serhii Prykhodko on 22.02.2022.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
