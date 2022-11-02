//
//  UserCell.swift
//  User
//
//  Created by Eren on 8/31/22.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: Properties
    let userImage : UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    let nameLbl : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Initiliaze
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions
    func configure() {
        contentView.addSubview(userImage)
        contentView.addSubview(nameLbl)
        configureViews()
    }
    
    func configureViews() {
        userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        userImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLbl.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16).isActive = true
        nameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        nameLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        nameLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }

}
