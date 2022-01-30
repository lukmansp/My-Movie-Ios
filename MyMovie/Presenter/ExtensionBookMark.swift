//
//  ExtensionBookMark.swift
//  MyMovie
//
//  Created by lukmanma on 30/01/22.
//

import Foundation
import UIKit

extension BookMarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkTableViewCell.identifier,for: indexPath) as! BookmarkTableViewCell
        cell.bookmarkLabel.text = result[indexPath.row].Title
        if let data = try? Data(contentsOf: URL(string: result[indexPath.row].Poster)!){
            cell.bookmarImage.image = UIImage(data: data)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
