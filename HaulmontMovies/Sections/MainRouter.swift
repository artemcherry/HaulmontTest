//
//  MainRouter.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    var screenBuilder: ModuleBuilderProtocol? {get set}
    func openProfile()
    func openMovieDescription(movie: MovieModel)
}

class MainRouter: MainRouterProtocol {
    
    var screenBuilder: ModuleBuilderProtocol?
    var navigationController: UINavigationController?
    
    init(screenBuilder: ModuleBuilderProtocol) {
        self.screenBuilder = screenBuilder
    }
    
    func openProfile() {
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(profileVC, animated: true)
    }
    
    func openMovieDescription(movie: MovieModel) {
        guard let movieVC = screenBuilder?.createMovieDescriptionModule(router: self, movie: movie) else { return }
        movieVC.modalPresentationStyle = .popover
        self.navigationController?.present(movieVC, animated: true)
    }
}
