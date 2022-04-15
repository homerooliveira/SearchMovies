import Foundation

struct ResultContainer<T>: Decodable where T: Decodable {
    let results: [T]?
}
