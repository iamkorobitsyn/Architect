//
//  TableViewCell.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

class MVVMMainCell: UITableViewCell {
    
    let photo = UIImageView()
    private let photoSide: CGFloat = 78
    var nameSurename = UILabel()
    
    var viewModel: MVVMMainCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else {return}
            self.nameSurename.text = viewModel.nameSurename
            viewModel.fetchImage { [weak self] imageData in
                guard let self = self else {return}
                self.photo.image = UIImage(data: imageData)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        instanceViews()
    }
    
    //MARK: - InstanceViews
    
    private func instanceViews() {
        contentView.addSubview(photo)
        contentView.addSubview(nameSurename)
        
        photo.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        photo.layer.cornerRadius = photoSide / 2

        
        nameSurename.text = "Mr. MVVM"
        nameSurename.textAlignment = .center
        nameSurename.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        nameSurename.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.widthAnchor.constraint(equalToConstant: photoSide),
            photo.heightAnchor.constraint(equalToConstant: photoSide),
            photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            
            nameSurename.leadingAnchor.constraint(equalTo: photo.trailingAnchor),
            nameSurename.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameSurename.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

