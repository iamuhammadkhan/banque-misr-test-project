//
//  MovieDetailsViewController.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    
    private var viewModel: MoviesViewModel
    
    @IBOutlet private weak var moviePoster: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var voteCountLabel: UILabel!
    
    init?(coder: NSCoder, viewModel: MoviesViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    static func instantiate(with viewModel: MoviesViewModel) -> MovieDetailsViewController {
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        return storyboard.instantiateViewController(identifier: MovieDetailsViewController.identifier) { coder in
            MovieDetailsViewController(coder: coder, viewModel: viewModel)
        }
    }
    
    private func setupViews() {
        navigationItem.title = "Movie Details"
        moviePoster.load(from: viewModel.generateMoviePosterURL(for: viewModel.selectedMovie))
        movieNameLabel.text = viewModel.selectedMovie?.title
        overviewLabel.text = viewModel.selectedMovie?.overview
        releaseDateLabel.text = viewModel.selectedMovie?.releaseDate
        popularityLabel.text = "\(viewModel.selectedMovie?.popularity ?? 0)"
        voteAverageLabel.text = "\(viewModel.selectedMovie?.voteAverage ?? 0)"
        voteCountLabel.text = "\(viewModel.selectedMovie?.voteCount ?? 0)"
    }
}
