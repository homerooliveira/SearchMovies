//
//  AsyncSequence+decode.swift
//  AutocompleteAsync
//
//  Created by Homero Oliveira on 14/04/22.
//

import Foundation

extension AsyncSequence where Element == Data {
    func decode<T: Decodable>(type: T.Type, decoder: JSONDecoder) -> AsyncThrowingMapSequence<Self, T> {
        map { data in
            try decoder.decode(type, from: data)
        }
    }
}
