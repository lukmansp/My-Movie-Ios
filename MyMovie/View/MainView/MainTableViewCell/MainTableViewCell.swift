//
//  MainTableViewCell.swift
//  MyMovie
//
//  Created by lukmanma on 28/01/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var imageViewCell: UIImageView!
    @IBOutlet var lableTitleCell: UILabel!
    @IBOutlet weak var checkLoveBtn: UIButton!
    
    static let identifier = "MainTableViewCell"
    
    static func nib () -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
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
