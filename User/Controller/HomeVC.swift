//
//  HomeVC.swift
//  User
//
//  Created by Eren on 8/31/22.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {
    
    // MARK: Properties
    var userModel = [UserModel]()
    var imageModel = [ImageModel]()
    var comingImageUrl = [String]()
    
    private let tableView : UITableView = {
       var table = UITableView()
        table.register(UserCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
     }
    
    // MARK: Functions
    func configure() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        configureViews()
        navigationItem.title = "PERSONS".localization()
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        fetchRequest(url: url) {
            let imageUrl = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos")!
            self.fetchRequestImage(url: imageUrl) {
                for var i in 0...self.imageModel.count {
                    i = i + 1
                    self.comingImageUrl.append(self.imageModel[i].url)
                    if i == 10 {
                        break
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func configureViews() {
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
 }

// MARK: TableView Extension
extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        cell.nameLbl.text = userModel[indexPath.row].name
        cell.userImage.downloaded(from: comingImageUrl[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PersonDetailVC()
        let users = userModel[indexPath.row]
        vc.personImage.downloaded(from: comingImageUrl[indexPath.row])
        vc.selectedPhoto = comingImageUrl[indexPath.row]
        vc.userNameLbl.text = users.username.uppercased()
        vc.addressTextView.text = users.address.street + " " + users.address.suite + " " + users.address.city
        vc.contactLbl.text = users.phone + "\n" + users.website
        vc.navigationItem.titleView?.backgroundColor = .red
        vc.navigationItem.title = users.name.uppercased()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


extension HomeVC {
    
    func fetchRequest(url : URL,completion : @escaping () -> () ) {
        
        AF.request(url, method: .get).response { response in
            
            if let data = response.data {
                do {
                    self.userModel = try JSONDecoder().decode([UserModel].self, from: data)
                    DispatchQueue.main.async {
                        completion()
                        
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
            }
            
        }
       
    }
}

extension HomeVC {
    
    func fetchRequestImage(url : URL,completion : @escaping () -> () ) {
        
        AF.request(url, method: .get).response { response in
            
            DispatchQueue.global().async {
                if let data = response.data {
                    do {
                        self.imageModel = try JSONDecoder().decode([ImageModel].self, from: data)
                        DispatchQueue.main.async {
                            completion()
                        }
                        
                    }catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
        }
    }
}

// MARK: Localization Extension
extension String {
    func localization() -> String {
        NSLocalizedString(self, tableName: "MultiLanguage", bundle: .main, value: self, comment: self)
    }
}

// MARK: UIImageView Extension
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
