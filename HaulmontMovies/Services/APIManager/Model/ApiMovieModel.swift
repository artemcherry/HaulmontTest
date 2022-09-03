//
//  ApiMovieModel.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import Foundation

struct ApiMovieModel: Codable {
    let title: String?
    let year: String?
    let released: String?
    let runTime: String?
    let genre: String?
    let director: String?
    let actors: String?
    let plot: String?
    let imdbRating: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case imdbRating
        case poster = "Poster"
    }
    
}
