//
//  DataProvider.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 03.09.2022.
//

import Foundation

final class DataProvider {
    
    static func getMovie(title:String, completion: @escaping(MovieModel?, Error?) -> Void) {
        ApiManager.getMovie(title: title) { apiMovie, error in
            if let apiMovie = apiMovie {
                let movie = MovieModel.init(with: apiMovie)
                DispatchQueue.main.async {
                    completion(movie, nil)
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}
