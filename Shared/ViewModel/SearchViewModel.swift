//
//  ContentViewModel.swift
//  AutocompleteAsync
//
//  Created by Homero Oliveira on 12/04/22.
//

import AsyncAlgorithms
import Combine
import Foundation

@available(macOS 9999, iOS 9999, *)
final class SearchViewModel: ObservableObject {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    private let urlSession = URLSession.shared
    
    @Published var text: String = ""
    @Published var movies: [Movie] = []
    
    @MainActor func fetchAutoCompleTask() async {
        let asyncCollection = $text
            .values
            .throttle(for: text.isEmpty ? .zero : .milliseconds(500))
            .removeDuplicates()
            .compactMap(makeURL(from:))
            .map { [unowned self] url in
                try await self.urlSession.data(from: url, delegate: nil).0
            }
            .decode(type: ResultContainer<Movie>.self, decoder: decoder)
        
        do {
            for try await resultContainer in asyncCollection {
                let newMovies = resultContainer.results ?? []
                movies = newMovies
            }
        } catch {
            print(error)
        }
    }
    
    private func makeURL(from text: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/search/movie"
        urlComponents.queryItems = [
            .init(name: "api_key", value: "API_KEY"),
            .init(name: "query", value: text)
        ]
        
        return urlComponents.url
    }
}
