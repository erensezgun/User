//
//  PersonDetailVC.swift
//  User
//
//  Created by Eren on 8/31/22.
//

import UIKit

class PersonDetailVC: UIViewController {
    // MARK: Properties
    var selectedPhoto : String = " "
    
    let userNameLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        return label
    }()
    
    let imageview: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let personImage: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 0.5
        return image
    }()
    
    let imageBtn: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle(" ", for: .normal)
        button.addTarget(self, action: #selector(imageBtnClicked), for: .touchUpInside)
        return button
    }()
    
    @objc func imageBtnClicked() {
        let vc = ImageVC()
        vc.userImage.downloaded(from: selectedPhoto)
        self.present(vc, animated: true, completion: nil)
          
    }
    
    let addressTextView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 20)
        text.backgroundColor = .white
        text.layer.cornerRadius = 16
        text.layer.masksToBounds = true
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 0.5
        return text
    }()
    
    let contactTitleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " CONTACT ".localization()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 0.5
        return label
    }()
    
    let contactLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 0.5
        return label
    }()
    
    let stackView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageview)
        view.addSubview(userNameLbl)
        view.addSubview(stackView)
        view.backgroundColor = .white
        configureViews()
        
    }
    // MARK: Functions
    func configureViews() {
        
        imageview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4).isActive = true
        
        imageview.addSubview(imageBtn)
        imageBtn.centerXAnchor.constraint(equalTo: imageview.centerXAnchor).isActive = true
        imageBtn.heightAnchor.constraint(equalToConstant: view.bounds.height / 5).isActive = true
        imageBtn.widthAnchor.constraint(equalToConstant: view.bounds.width / 3).isActive = true
        
        imageview.addSubview(personImage)
        personImage.centerXAnchor.constraint(equalTo: imageview.centerXAnchor).isActive = true
        personImage.bottomAnchor.constraint(equalTo: userNameLbl.topAnchor, constant: 0).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 5).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: view.bounds.width / 3).isActive = true
        
        imageview.addSubview(userNameLbl)
        userNameLbl.trailingAnchor.constraint(equalTo: imageview.trailingAnchor,constant: -32).isActive = true
        userNameLbl.leadingAnchor.constraint(equalTo: imageview.leadingAnchor, constant: 32).isActive = true
        userNameLbl.bottomAnchor.constraint(equalTo: imageview.bottomAnchor).isActive = true
        userNameLbl.heightAnchor.constraint(equalTo: imageview.heightAnchor, multiplier: 1/4).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: imageview.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/4).isActive = true
        
        stackView.addSubview(addressTextView)
        stackView.addSubview(contactTitleLbl)
        stackView.addSubview(contactLbl)
        
        addressTextView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 32).isActive = true
        addressTextView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        addressTextView.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: view.bounds.height / 16).isActive = true
        addressTextView.heightAnchor.constraint(equalToConstant: view.bounds.height / 8).isActive = true
        
        contactTitleLbl.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 32).isActive = true
        contactTitleLbl.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        contactTitleLbl.topAnchor.constraint(equalTo: addressTextView.bottomAnchor, constant: view.bounds.height / 16).isActive = true
        contactTitleLbl.heightAnchor.constraint(equalToConstant: view.bounds.height / 16).isActive = true
        
        contactLbl.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 32).isActive = true
        contactLbl.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        contactLbl.topAnchor.constraint(equalTo: contactTitleLbl.bottomAnchor, constant: view.bounds.height / 16).isActive = true
        contactLbl.heightAnchor.constraint(equalToConstant: view.bounds.height / 8).isActive = true
         
    }
    
}
