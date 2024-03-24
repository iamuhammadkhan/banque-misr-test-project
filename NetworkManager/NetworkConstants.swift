//
//  NetworkConstants.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import Foundation

struct NetworkConstants {
    static let scheme = "https"
    static let host = "api.themoviedb.org"
    static let path = "/3/movie/"
    static let nowPlayingMoviesService = "now_playing"
    static let popularMoviesService = "popular"
    static let upcomingMoviesService = "upcoming"
    static let movieDetailService = "movie_id"
}

struct TMDBConstants {
    static let apiKey = "b1280361cc6dae0cf4f9ead71b1c31ac"
    static let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMTI4MDM2MWNjNmRhZTBjZjRmOWVhZDcxYjFjMzFhYyIsInN1YiI6IjY1ZmJjZTA3NjA2MjBhMDE0OTI1N2I2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PlMQX7QMZGDt-GPHQ6hdekA4KiPTipW0zgJZcmUyUbg"
}

struct MoviePosterConstants {
    static let scheme = "https"
    static let host = "image.tmdb.org"
    static let path = "/t/p/original/"
}
