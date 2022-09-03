//
//  MoviesCollectionView.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import UIKit

protocol MoviesCollectionViewProtocol: AnyObject {
    func getMovies(movies: [MovieModel]?)
}

class MoviesCollectionView: UIViewController {
    
    private let moviesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: 300)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MovieCollectionCell.self, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        collection.backgroundColor = .navigationBackground
        return collection
    }()
    
    var presenter: MoviesCollectionPresenterProtocol?
    private var movies: [MovieModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Movie Browser"
        presenter?.getMovies()
    }
    
    private func setupUI() {
        
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(openProfile))
        let searchMovieButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(openSearch))
        
        self.navigationItem.rightBarButtonItem = searchMovieButton
        self.navigationItem.leftBarButtonItem = profileButton
        
        navigationController?.navigationItem.leftBarButtonItem = profileButton
        navigationController?.navigationItem.rightBarButtonItem = searchMovieButton
        view.addSubview(moviesCollection)
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        NSLayoutConstraint.activate([
            moviesCollection.topAnchor.constraint(equalTo: view.topAnchor),
            moviesCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    @objc private func openProfile() {
        presenter?.openProfile()
    }
    
    @objc private func openSearch() {
        
    }
    
}
//MARK: - ViewProtocol
extension MoviesCollectionView: MoviesCollectionViewProtocol {
    func getMovies(movies: [MovieModel]?) {
        guard let movies = movies else { return }
        self.movies = movies
        self.moviesCollection.reloadData()
    }
}

//MARK: - CollectionViewDelegate/DataSource
extension MoviesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as? MovieCollectionCell,
               let movies = movies else { return UICollectionViewCell() }
        let movie = movies[indexPath.row]
        cell.setupCell(model: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movies = movies else { return }
        presenter?.openMovieDescription(movie: movies[indexPath.row])
    }
}
