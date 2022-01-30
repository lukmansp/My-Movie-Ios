//
//  BookMarkViewController.swift
//  MyMovie
//
//  Created by lukmanma on 29/01/22.
//

import UIKit

class BookMarkViewController: UIViewController {
    
    let favLovalMovie = MovieLocalRepository()
    var result = [Users]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let localItem = favLovalMovie.getLocalMovie()
       
       let user = localItem.map{Users(Title: $0.Title, Poster: $0.Poster)}
        self.result.append(contentsOf: user)
        self.tableView.register(BookmarkTableViewCell.nib(), forCellReuseIdentifier: BookmarkTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
       // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
