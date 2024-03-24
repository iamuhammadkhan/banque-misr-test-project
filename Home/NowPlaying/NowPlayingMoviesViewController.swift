//
//  ViewController.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import UIKit
import Combine

final class NowPlayingMoviesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = MoviesViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        navigationItem.backButtonTitle = ""
        setupTableView()
        getMoviesData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MovieItemTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: MovieItemTableViewCell.identifier)
    }
    
    private func getMoviesData() {
        viewModel.getNowPlayingMovies()
        viewModel.movies
            .sink { [weak self] movies in
                self?.viewModel.nowPlayingMovies += movies
                self?.tableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
    }
}

extension NowPlayingMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.nowPlayingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieItemTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let movie = viewModel.nowPlayingMovies[indexPath.row]
        cell.configure(with: movie, viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.nowPlayingMovies.count - 4 {
            viewModel.nowPlayingMoviesPage += 1
            viewModel.getNowPlayingMovies()
        }
    }
}

extension NowPlayingMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.updateSelectedMovie(with: viewModel.nowPlayingMovies[indexPath.row])
        let vc = MovieDetailsViewController.instantiate(with: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
