//
//  AutocompleteAsyncApp.swift
//  Shared
//
//  Created by Homero Oliveira on 12/04/22.
//

import SwiftUI

@available(macOS 9999, iOS 9999, *)
@main
struct AutocompleteAsyncApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel())
                .frame(minWidth: 200, minHeight: 200, alignment: .top)
        }
    }
}
