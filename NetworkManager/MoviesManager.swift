//
//  MoviesManager.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 22/3/24.
//

import Foundation
import Combine

protocol MoviesManagerProtocol: AnyObject {
    var networkManager: NetworkManagerProtocol { get }
    func getNowPlayingMovies(for page: Int) -> AnyPublisher<MoviesList, Error>
    func getPopularMovies(for page: Int) -> AnyPublisher<MoviesList, Error>
    func getUpcomingMovies(for page: Int) -> AnyPublisher<MoviesList, Error>
}

final class MoviesManager: MoviesManagerProtocol {
    let networkManager: NetworkManagerProtocol
        
    init() {
        networkManager = NetworkManager()
    }
    
    func getNowPlayingMovies(for page: Int) -> AnyPublisher<MoviesList, any Error> {
        var endPoint = Endpoint.nowPlaying
        endPoint.queryItems =  [URLQueryItem(name: "language", value: "en-US"),
                                URLQueryItem(name: "page", value: "\(page)")]
        return networkManager.request(type: MoviesList.self, url: endPoint.url, httpMethod: .GET, headers: endPoint.headers, parameters: nil)
    }
    
    func getPopularMovies(for page: Int) -> AnyPublisher<MoviesList, any Error> {
        var endPoint = Endpoint.popular
        endPoint.queryItems = [URLQueryItem(name: "language", value: "en-US"),
                               URLQueryItem(name: "page", value: "\(page)")]
        return networkManager.request(type: MoviesList.self, url: endPoint.url, httpMethod: .GET, headers: endPoint.headers, parameters: nil)
    }
    
    func getUpcomingMovies(for page: Int) -> AnyPublisher<MoviesList, any Error> {
        var endPoint = Endpoint.upcoming
        endPoint.queryItems = [URLQueryItem(name: "language", value: "en-US"),
                               URLQueryItem(name: "page", value: "\(page)")]
        return networkManager.request(type: MoviesList.self, url: endPoint.url, httpMethod: .GET, headers: endPoint.headers, parameters: nil)
    }
}
