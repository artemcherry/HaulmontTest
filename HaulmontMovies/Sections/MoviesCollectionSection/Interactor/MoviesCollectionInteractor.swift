//
//  MoviesCollectionInteractor.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import Foundation

protocol MoviesCollectionInteractorProtocol: AnyObject {
    func getMovieList(completion: @escaping ([MovieModel]?, Error?) -> Void)
}

class MoviesCollectionInteractor: MoviesCollectionInteractorProtocol {
    
    private let movieTitles = ["The+Amazing+Spider+Man", "Unbroken", "Blade+Runner", "The+Intouchables", "Inception", "The+Rock", "Furious+7", "The+Avengers", "Iron+Man", "Thor", "The+Dark+Knight", "Black+Panther", "Loki", "Spider+Man+Homecoming", "2012", "Game+of+Thrones", "1", "Terminator+2: Judgment+Day", "Iron+Man+3", "4", "Final+Destination+5", "Big+Hero 6", "8", "9", "Fahrenheit 9/11", "12", "13", "14+Peaks+Nothing+Is+Impossible", "15", "16+Blocks"]
    
    private var movieCollection = [MovieModel]()
    
    private func getMovies(completion: @escaping([MovieModel]?, Error?) -> Void)  {
        var movieModels = [MovieModel]()
        for title in movieTitles {
            DataProvider.getMovie(title: title) { movie, error in
                if let movie = movie {
                    DispatchQueue.main.async {
                        movieModels.append(movie)
                        completion(movieModels,nil)
                    }
                    
                }
                
//                print(movieModels)

            }
        }
    }

    
    func getMovieList(completion: @escaping ([MovieModel]?, Error?) -> Void) {
        getMovies { movies, error in
            if let movies = movies {
                completion(movies, nil)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
}
