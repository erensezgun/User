//
//  ImageVC.swift
//  User
//
//  Created by Eren on 9/13/22.
//

import UIKit

class ImageVC: UIViewController {

    // MARK: Properties
    let customView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let userImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        return image
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: Functions
    func configure() {
        view.addSubview(customView)
        configureViews()
    }
    
    func configureViews() {
        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        customView.addSubview(userImage)
        userImage.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        userImage.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        userImage.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 3/4).isActive = true
        userImage.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 3/4).isActive = true
    }
}
