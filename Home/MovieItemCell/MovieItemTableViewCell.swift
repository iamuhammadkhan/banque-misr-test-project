//
//  MovieItemTableViewCell.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import UIKit

final class MovieItemTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieContainerView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleContainerView: UIView!
    @IBOutlet private weak var movieTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        movieContainerView.applyCornerRadius(of: 8)
        movieContainerView.applyShadow()
    }
    
    func configure(with movie: Movie?, viewModel: MoviesViewModel) {
        movieTitleLabel.text = movie?.title
        movieImageView.load(from: viewModel.generateMoviePosterURL(for: movie))
    }
}
