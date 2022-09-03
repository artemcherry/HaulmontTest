//
//  MovieModel.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import Foundation

struct MovieModel {
    
    let imageUrl: String?
    let title: String?
    let genre: String?
    let year: String?
    let length: String?
    let rating: String?
    let directors: String?
    let actors: String?
    let description: String?
    
    init?(with model: ApiMovieModel) {
        self.imageUrl = model.poster
        self.title = model.title
        self.genre = model.genre
        self.year = model.year
        self.length = model.runTime
        self.rating = model.imdbRating
        self.directors = model.director
        self.actors = model.actors
        self.description = model.plot
    }
}
