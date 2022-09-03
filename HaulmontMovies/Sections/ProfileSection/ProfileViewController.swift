//
//  ProfileViewController.swift
//  HaulmontMovies
//
//  Created by Артем Вишняков on 29.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .navigationBackground
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .buttonBackground
        button.tintColor = .titleColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(closeMe), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Condensed Demi Bold", size: 24)
        label.textColor = .titleColor
        label.text = "Артем Вишняков"
        label.textAlignment = .center
        return label
    }()
    
    private let genderAndYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Condensed Demi Bold", size: 18)
        label.textColor = .textColor
        label.text = "Male | Born 11.08.1995"
        label.textAlignment = .center
        return label
    }()
    
    private let myImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 100
        image.clipsToBounds = true
        image.image = UIImage(named: "myPicture")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Condensed Regular", size: 16)
        label.textColor = .textColor
        label.text = "+7 (987) 949-05-52"
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next Condensed Regular", size: 16)
        label.textColor = .textColor
        label.text = "artem.vishniakov95@yandex.ru"
        label.textAlignment = .center
        return label
    }()
    
    private let phoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "phone"), for: .normal)
        button.backgroundColor = .buttonBackground
        button.tintColor = .titleColor
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "envelope"), for: .normal)
        button.backgroundColor = .buttonBackground
        button.tintColor = .titleColor
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func closeMe() {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .transparent
        
        view.addSubview(mainView)
        mainView.addSubview(closeButton)
        mainView.addSubview(nameLabel)
        mainView.addSubview(genderAndYearLabel)
        mainView.addSubview(myImage)
        mainView.addSubview(phoneNumberLabel)
        mainView.addSubview(emailLabel)
        mainView.addSubview(phoneButton)
        mainView.addSubview(emailButton)

        
        NSLayoutConstraint.activate([
        
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            closeButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 40),
            closeButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 200),
            nameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            genderAndYearLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            genderAndYearLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            genderAndYearLabel.heightAnchor.constraint(equalToConstant: 20),
            genderAndYearLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            myImage.topAnchor.constraint(equalTo: genderAndYearLabel.bottomAnchor, constant: 10),
            myImage.heightAnchor.constraint(equalToConstant: 200),
            myImage.widthAnchor.constraint(equalToConstant: 200),
            myImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 10),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            phoneButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            phoneButton.widthAnchor.constraint(equalToConstant: 60),
            phoneButton.heightAnchor.constraint(equalToConstant: 60),
            phoneButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -60),
            
            emailButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailButton.widthAnchor.constraint(equalToConstant: 60),
            emailButton.heightAnchor.constraint(equalToConstant: 60),
            emailButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 60),
        
        ])
    }
    
}
