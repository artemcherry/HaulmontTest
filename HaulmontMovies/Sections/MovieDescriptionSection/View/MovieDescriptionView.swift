//
//  MovieDescriptionView.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import UIKit

protocol MovieDescriptionViewProtocol: AnyObject {
    func setupView(movie: MovieModel)
}

class MovieDescriptionView: UIViewController {
    
    private let ticketView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .navigationBackground
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    private let lengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .textColor
        return label
    }()
    
    private let starsRatingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleGothic Regular", size: 24)
        label.textColor = .titleColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var moviePoster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .titleColor
        label.textAlignment = .right
        label.text = "Genre"
        return label
    }()
    
    private let directorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textAlignment = .right
        label.textColor = .titleColor
        label.text = "Directors"
        return label
    }()
    
    private let actorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .titleColor
        label.text = "Actors"
        label.textAlignment = .right
        return label
    }()
    
    private let actorsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .textColor
        label.numberOfLines = 0
        return label
    }()
    
    private let directorsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .textColor
        return label
    }()
    
    private let genreValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .textColor
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .textColor
        label.numberOfLines = 0
        return label
    }()
    
    var presenter: MovieDescriptionPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.getMovie()
    }
    
    private func setupUI() {
        view.backgroundColor = .transparent
        view.addSubview(ticketView)
        ticketView.addSubview(lengthLabel)
        ticketView.addSubview(starsRatingImageView)
        ticketView.addSubview(titleLabel)
        ticketView.addSubview(moviePoster)
        ticketView.addSubview(genreLabel)
        ticketView.addSubview(genreValueLabel)
        ticketView.addSubview(directorsLabel)
        ticketView.addSubview(directorsValueLabel)
        ticketView.addSubview(actorsLabel)
        ticketView.addSubview(actorsValueLabel)
        ticketView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            ticketView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ticketView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ticketView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            
            lengthLabel.topAnchor.constraint(equalTo: ticketView.topAnchor, constant: 15),
            lengthLabel.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 15),
            lengthLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            lengthLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            starsRatingImageView.topAnchor.constraint(equalTo: ticketView.topAnchor, constant: 15),
            starsRatingImageView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -15),
            starsRatingImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            starsRatingImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            titleLabel.centerXAnchor.constraint(equalTo: ticketView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: starsRatingImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(lessThanOrEqualTo: ticketView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: ticketView.trailingAnchor),

            moviePoster.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            moviePoster.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor),
            moviePoster.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            genreLabel.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 15),
            genreLabel.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 20),
            genreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            genreLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            genreValueLabel.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 15),
            genreValueLabel.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 20),
            genreValueLabel.heightAnchor.constraint(equalToConstant: 20),
            genreValueLabel.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor),
            
            directorsLabel.topAnchor.constraint(equalTo: genreValueLabel.bottomAnchor, constant: 15),
            directorsLabel.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 20),
            directorsLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            directorsLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            directorsValueLabel.topAnchor.constraint(equalTo: genreValueLabel.bottomAnchor, constant: 15),
            directorsValueLabel.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 20),
            directorsValueLabel.heightAnchor.constraint(equalToConstant: 20),
            directorsValueLabel.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor),
            
            actorsLabel.topAnchor.constraint(equalTo: directorsLabel.bottomAnchor, constant: 15),
            actorsLabel.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 20),
            actorsLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            actorsLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            actorsValueLabel.topAnchor.constraint(equalTo: directorsLabel.bottomAnchor, constant: 15),
            actorsValueLabel.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 20),
            actorsValueLabel.heightAnchor.constraint(equalToConstant: 40),
            actorsValueLabel.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: actorsValueLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
        ])
    }
}

extension MovieDescriptionView: MovieDescriptionViewProtocol {
    func setupView(movie: MovieModel) {
        lengthLabel.text = movie.length
        titleLabel.text = movie.title
        guard let url = URL(string: movie.imageUrl ?? "") else { return }
        moviePoster.load(url: url)
        genreValueLabel.text = movie.genre
        directorsValueLabel.text = movie.directors
        actorsValueLabel.text = movie.actors
        descriptionLabel.text = movie.description
        
        guard let floatRating = Float(movie.rating ?? "") else { return }
        switch floatRating {
        case 0...2:
            starsRatingImageView.image = UIImage(named: "0")
        case 2.1...4:
            starsRatingImageView.image = UIImage(named: "1")
        case 4.1...6:
            starsRatingImageView.image = UIImage(named: "3")
        case 6.1...8:
            starsRatingImageView.image = UIImage(named: "4")
        case 8.1...10:
            starsRatingImageView.image = UIImage(named: "5")
        default: starsRatingImageView.image = UIImage()
        }
    }
}
