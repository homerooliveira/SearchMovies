//
//  MovieRowView.swift
//  AutocompleteAsync
//
//  Created by Homero Oliveira on 13/04/22.
//

import SwiftUI

struct MovieRowView: View {
    let title: String
    let overview: String
    let posterURL: URL?
    
    var body: some View {
        HStack {
            AsyncImage(url: posterURL)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 92, maxHeight: 122)
                .cornerRadius(4)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                Text(overview.isEmpty ? "Don't have overview." : overview)
                    .font(.body)
                    .lineLimit(2)
            }
        }
    }
}
