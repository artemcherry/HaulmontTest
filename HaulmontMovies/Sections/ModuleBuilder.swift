//
//  ModuleBuilder.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    func createMoviesCollectionModule(router: MainRouter) -> UIViewController?
    func createMovieDescriptionModule(router: MainRouter, movie: MovieModel) -> UIViewController?
}
   
    

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createMoviesCollectionModule(router: MainRouter) -> UIViewController? {
        let view = MoviesCollectionView()
        let interactor = MoviesCollectionInteractor()
        let presenter = MoviesCollectionPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }

    func createMovieDescriptionModule(router: MainRouter, movie: MovieModel) -> UIViewController? {
        let view = MovieDescriptionView()
        let presenter = MovieDescriptionPresenter(view: view, router: router, movie: movie)
        view.presenter = presenter
        return view
    }

    
}
