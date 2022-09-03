//
//  ApiManager.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import Foundation


class ApiManager {
   
    
    static func getMovie(title: String, completion: @escaping(ApiMovieModel?, Error?) -> Void) {
        let stringUrl = "https://www.omdbapi.com/?apikey=a547ff39&t=\(title)"
        guard let url  = URL(string: stringUrl) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                guard let parcedData = try? JSONDecoder().decode(ApiMovieModel.self, from: data) else { return }
                completion(parcedData, nil)
            }
            else {
                completion(nil, error)
            }
        }
            dataTask.resume()
    }
}
