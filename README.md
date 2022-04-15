# SearchMovies
Sample app to show search request using async-await and [swift-async-algorithms](https://github.com/apple/swift-async-algorithms)

![image](.assets/search.gif)

## Motivation

To improve the performance of the search request, I used the `throttle` function of `swift-async-algorithm` which ensures that the minimum interval has elapsed between text update so that the app doesn't make a request for every text update. For more info see `fetchAutoCompleTask` in [SearchViewModel.swift](Shared/ViewModel/SearchViewModel.swift)

## Quick setup

Change the string `"API_KEY"` in [SearchViewModel.swift](Shared/ViewModel/SearchViewModel.swift) to your API key of [TheMovieDB](https://developers.themoviedb.org/3/getting-started/introduction).

```swift 
...
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
...
```

For best results, run the macOS Catalyst or iOS target.

## Requirements

- macOS 12.3.0 or +
- Xcode 13.3.0 or +
