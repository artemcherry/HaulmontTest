//
//  MovieDescriptionPresenter.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import Foundation

protocol MovieDescriptionPresenterProtocol: AnyObject {
    func getMovie()
}

class MovieDescriptionPresenter: MovieDescriptionPresenterProtocol {
    
    private let view: MovieDescriptionViewProtocol?
    private let router: MainRouterProtocol?
    private let movie: MovieModel
    
    init(view: MovieDescriptionViewProtocol, router: MainRouterProtocol, movie: MovieModel) {
        self.view = view
        self.router = router
        self.movie = movie
    }
    
    func getMovie() {
        view?.setupView(movie: movie)
    }
}
