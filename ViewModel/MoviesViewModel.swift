//
//  MoviesViewModel.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 22/3/24.
//

import Foundation
import Combine

final class MoviesViewModel {
    private let moviesManager = MoviesManager()
    var cancellables = Set<AnyCancellable>()
    var movies = PassthroughSubject<[Movie], Never>()
    lazy var nowPlayingMovies: [Movie] = []
    lazy var upcomingMovies: [Movie] = []
    lazy var popularMovies: [Movie] = []
    lazy var nowPlayingMoviesPage = 1
    lazy var upcomingMoviesPage = 1
    lazy var popularMoviesPage = 1
    lazy var selectedMovie: Movie? = nil

    func getNowPlayingMovies() {
        moviesManager.getNowPlayingMovies(for: nowPlayingMoviesPage)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("🔥 getNowPlayingMovies failed with error:", error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] model in
                self?.movies.send(model.results)
            }
            .store(in: &cancellables)
    }
    
    func getPopularMovies() {
        moviesManager.getPopularMovies(for: popularMoviesPage)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("🔥 getPopularMovies failed with error:", error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] model in
                self?.movies.send(model.results)
            }
            .store(in: &cancellables)
    }
    
    func getUpcomingMovies() {
        moviesManager.getUpcomingMovies(for: upcomingMoviesPage)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("🔥 getUpcomingMovies failed with error:", error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] model in
                self?.movies.send(model.results)
            }
            .store(in: &cancellables)
    }
    
    func updateSelectedMovie(with movie: Movie) {
        selectedMovie = movie
    }
    
    func generateMoviePosterURL(for movie: Movie?) -> URL {
        Endpoint.moviePosterURL(for: movie?.backdropPath ?? "")
    }
}
