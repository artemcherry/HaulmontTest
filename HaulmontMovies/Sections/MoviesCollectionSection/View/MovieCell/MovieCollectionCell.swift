//
//  MovieCollectionCell.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionCell"
    
    private var moviePoster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "trash.fill")
        return image
    }()
    
    private var transparentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .transparent
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleGothic Regular", size: 18)
        label.textColor = .white
        label.text = "Побег из Шоушенка"
        label.contentMode = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genreYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 12)
        label.textColor = .lightGray
        label.text = "Drama, Crime • 1994"
        return label
    }()
    
    private let lengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 16)
        label.textColor = .white
        label.text = "2h 22min"
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleGothic Regular", size: 18)
        label.textColor = .white
        label.text = "9.8"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(moviePoster)
        contentView.addSubview(transparentView)
        transparentView.addSubview(titleLabel)
        transparentView.addSubview(genreYearLabel)
        transparentView.addSubview(lengthLabel)
        transparentView.addSubview(ratingLabel)

        
        NSLayoutConstraint.activate([
        
            moviePoster.topAnchor.constraint(equalTo: contentView.topAnchor),
            moviePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            transparentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 220),
            transparentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            transparentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: transparentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            genreYearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            genreYearLabel.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor),
            genreYearLabel.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor),
            genreYearLabel.heightAnchor.constraint(equalToConstant: 16),
            
            lengthLabel.topAnchor.constraint(equalTo: genreYearLabel.bottomAnchor, constant: 4),
            lengthLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor),
            lengthLabel.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor),
            lengthLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ratingLabel.topAnchor.constraint(equalTo: genreYearLabel.bottomAnchor, constant: 4),
            ratingLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor,constant: -10),
            ratingLabel.heightAnchor.constraint(equalToConstant: 24),
        
        ])
    }
    
    func setupCell(model: MovieModel) {
        guard let url = URL(string: model.imageUrl ?? "") else { return }
        moviePoster.load(url: url)
        titleLabel.text = model.title ?? ""
        genreYearLabel.text = "\(model.genre ?? "") • \(model.year ?? "")"
        lengthLabel.text = model.length ?? ""
        ratingLabel.text = model.rating ?? ""

    }
}
