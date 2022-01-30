//
//  MainCollectionViewCell.swift
//  MyMovie
//
//  Created by lukmanma on 29/01/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
 

    @IBOutlet weak var collectionMyImage: UIImageView!
    @IBOutlet weak var collectionMyLabel: UILabel!
    static let identifier = "MainCollectionViewCell"
        
    static func nib () -> UINib {
            return UINib(nibName: "MainCollectionViewCell", bundle: nil)
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }
    
}
