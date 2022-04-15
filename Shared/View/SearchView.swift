//
//  ContentView.swift
//  Shared
//
//  Created by Homero Oliveira on 12/04/22.
//

import SwiftUI

@available(macOS 9999, iOS 9999, *)
struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
    var searchTextField: some View {
        Label {
            TextField("Search", text: $viewModel.text)
                .font(.largeTitle)
        } icon: {
            Image(systemName: "magnifyingglass")
                .font(.title)
        }
        .padding([.top, .leading, .trailing], 10)
    }
    
    var resultsList: some View {
        List {
            ForEach(viewModel.movies) { movie in
               MovieRowView(
                title: movie.title,
                overview: movie.overview,
                posterURL: movie.posterURL
               )
            }
        }
        .listStyle(.plain)
    }
    
    var body: some View {
        VStack {
            searchTextField
            resultsList
        }
        .task {
            await viewModel.fetchAutoCompleTask()
        }
    }
}

@available(macOS 9999, iOS 9999, *)
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
