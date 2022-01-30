//
//  BookmarkTableViewCell.swift
//  MyMovie
//
//  Created by lukmanma on 30/01/22.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    @IBOutlet weak var bookmarImage: UIImageView!
    @IBOutlet weak var bookmarkLabel: UILabel!
   
    static let identifier = "BookmarkTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BookmarkTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
