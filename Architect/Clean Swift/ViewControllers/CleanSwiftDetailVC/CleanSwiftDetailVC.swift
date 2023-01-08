//
//  DetailViewController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

class CleanSwiftDetailVC: UIViewController {
    
    var object: CleanSwiftUser?
    
    private let photo = UIImageView()
    private let photoSide: CGFloat = 200
    
    private let nameSurename = UILabel()
    private let age = UILabel()
    private let gender = UILabel()
    private let mail = UILabel()
    
    private let likeButton = UIButton()
    
    private let ageIcon = UIImageView()
    private let genderIcon = UIImageView()
    private let mailIcon = UIImageView()
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        view.backgroundColor = UIColor.lightGray
        
        instanceViews()
        getFavoriteStatus()
        
        likeButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
    }
    
    //MARK: - Instance Favorite Status
    
    private func getFavoriteStatus() {
        guard let object = object else { return }
        isFavorite = CleanSwiftStorageManager.instance.getFavoriteStatus(for: "CleanSwift\(object.email)")
        likeButton.tintColor = isFavorite ? .red : .white
    }
    
    @objc func toggleFavorite() {
        isFavorite.toggle()
        likeButton.tintColor = isFavorite ? .red : .white
        
        guard let object = object else { return }
        CleanSwiftStorageManager.instance.setFavoriteStatus(for: "CleanSwift\(object.email)",
                                                      for: isFavorite)
    }
    
    //MARK: - Instance Views
    
    private func instanceViews() {
        
        let viewArray = [photo, nameSurename, age, gender, mail,
                         likeButton, ageIcon, genderIcon, mailIcon]
        
        for view in viewArray {
            self.view.addSubview(view)
        }
        
        if let object = object {
            
            nameSurename.text = "\(object.firstName) \(object.lastName)"
            age.text = String(object.age)
            gender.text = object.gender
            mail.text = object.email
            
            
            CleanSwiftNetworkManager.instance.fetchImage(url: object.image) { result in
                switch result {
                case.success(let image):
                    self.photo.image = UIImage(data: image)
                case.failure(let error):
                    print(error)
                }
            }
        }
        
        photo.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        photo.layer.cornerRadius = photoSide / 2
        
        nameSurename.textAlignment = .center
        nameSurename.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        age.textAlignment = .center
        age.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        gender.textAlignment = .center
        gender.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        mail.textAlignment = .center
        mail.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        
        let likeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        likeImage.image = UIImage(systemName: "heart.fill")
        likeImage.contentMode = .scaleAspectFit
        likeButton.addSubview(likeImage)
        likeButton.tintColor = UIColor.white
        
        ageIcon.image = UIImage(systemName: "infinity")
        ageIcon.contentMode = .scaleAspectFit
        genderIcon.image = UIImage(systemName: "person.2")
        genderIcon.contentMode = .scaleAspectFit
        mailIcon.image = UIImage(systemName: "mail")
        mailIcon.contentMode = .scaleAspectFit
        
        
        //MARK: - Set Constraints
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        nameSurename.translatesAutoresizingMaskIntoConstraints = false
        age.translatesAutoresizingMaskIntoConstraints = false
        gender.translatesAutoresizingMaskIntoConstraints = false
        mail.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        ageIcon.translatesAutoresizingMaskIntoConstraints = false
        genderIcon.translatesAutoresizingMaskIntoConstraints = false
        mailIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.widthAnchor.constraint(equalToConstant: photoSide),
            photo.heightAnchor.constraint(equalToConstant: photoSide),
            photo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photo.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            nameSurename.widthAnchor.constraint(equalToConstant: 300),
            nameSurename.heightAnchor.constraint(equalToConstant: 30),
            nameSurename.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameSurename.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            age.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            age.heightAnchor.constraint(equalToConstant: 30),
            age.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            age.topAnchor.constraint(equalTo: nameSurename.bottomAnchor, constant: 20),
            gender.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            gender.heightAnchor.constraint(equalToConstant: 30),
            gender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gender.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 10),
            mail.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            mail.heightAnchor.constraint(equalToConstant: 30),
            mail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mail.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 10),
            likeButton.widthAnchor.constraint(equalToConstant: 50),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.bottomAnchor.constraint(equalTo: photo.bottomAnchor),
            likeButton.trailingAnchor.constraint(equalTo: photo.trailingAnchor),
            ageIcon.widthAnchor.constraint(equalToConstant: 30),
            ageIcon.heightAnchor.constraint(equalToConstant: 30),
            ageIcon.centerYAnchor.constraint(equalTo: age.centerYAnchor),
            ageIcon.trailingAnchor.constraint(equalTo: age.leadingAnchor, constant: -10),
            genderIcon.widthAnchor.constraint(equalToConstant: 30),
            genderIcon.heightAnchor.constraint(equalToConstant: 30),
            genderIcon.centerYAnchor.constraint(equalTo: gender.centerYAnchor),
            genderIcon.trailingAnchor.constraint(equalTo: gender.leadingAnchor, constant: -10),
            mailIcon.widthAnchor.constraint(equalToConstant: 30),
            mailIcon.heightAnchor.constraint(equalToConstant: 30),
            mailIcon.centerYAnchor.constraint(equalTo: mail.centerYAnchor),
            mailIcon.trailingAnchor.constraint(equalTo: mail.leadingAnchor, constant: -10)
        ])
    }
}
