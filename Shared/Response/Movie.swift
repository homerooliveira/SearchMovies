//
//  Movie.swift
//  AutocompleteAsync
//
//  Created by Homero Oliveira on 13/04/22.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        posterPath.flatMap {
            URL(string: "https://image.tmdb.org/t/p/w92/\($0)")
        }
    }
}
