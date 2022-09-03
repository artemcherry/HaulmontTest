//
//  MoviesCollectionPresenter.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import Foundation

protocol MoviesCollectionPresenterProtocol: AnyObject {
    func openProfile()
    func openMovieDescription(movie: MovieModel)
    func getMovies()
}

class MoviesCollectionPresenter: MoviesCollectionPresenterProtocol {
    
    private let view: MoviesCollectionViewProtocol?
    private let interactor: MoviesCollectionInteractorProtocol?
    private let router: MainRouterProtocol?
    private var movies: [MovieModel]?
    
    init(view: MoviesCollectionViewProtocol, interactor: MoviesCollectionInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func openProfile() {
        router?.openProfile()
    }
    
    func openMovieDescription(movie: MovieModel) {
        router?.openMovieDescription(movie: movie)
    }
    
    func getMovies() {
        interactor?.getMovieList(completion: { movies,  error in
            if let movies = movies {
                self.view?.getMovies(movies: movies)
            }
            else {
                print("getting movies error")
            }
        })
    }
}
