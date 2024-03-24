//
//  Endpoint.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = NetworkConstants.scheme
        components.host = NetworkConstants.host
        components.path = NetworkConstants.path + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: String] {
        let headers: [String: String] = [ "accept": "application/json",
                                          "Authorization": "Bearer \(TMDBConstants.accessToken)" ]
        return headers
    }
    
    static func moviePosterURL(for id: String) -> URL {
        var components = URLComponents()
        components.scheme = MoviePosterConstants.scheme
        components.host = MoviePosterConstants.host
        components.path = MoviePosterConstants.path + id
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    static var nowPlaying: Self {
        return Endpoint(path: NetworkConstants.nowPlayingMoviesService)
    }
    
    static var popular: Self {
        return Endpoint(path: NetworkConstants.popularMoviesService)
    }
    
    static var upcoming: Self {
        return Endpoint(path: NetworkConstants.upcomingMoviesService)
    }
    
    static var details: Self {
        return Endpoint(path: NetworkConstants.movieDetailService)
    }
}
