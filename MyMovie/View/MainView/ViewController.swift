//
//  ViewController.swift
//  MyMovie
//
//  Created by lukmanma on 28/01/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var navigateCollection: UIButton!
    var movie = [Movie]()
    var saveContent = [Users]()
    
    var getUser = setUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
        searchTextField.delegate = self
        self.fetchData()
        
        self.collectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(navigateBtn))
        getUser.configure()
        saveContent = getUser.users
        // Do any additional setup after loading the view.
    }
    
    @objc private func navigateBtn(){
        let storyboardMY = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboardMY.instantiateViewController(identifier:"BookMarkViewController" )
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func fetchData(){
        print("coba request")
        let URL: String = "https://www.omdbapi.com/?apikey=3aea79ac&s=fast%20and&type=movie"
        AF.request(URL ,method: .get).responseDecodable(of: MovieResult.self){[weak self] response in
            self!.movie = response.value!.Search
            DispatchQueue.main.async {
                self!.tableView.reloadData()
            }
        }
    }

}


