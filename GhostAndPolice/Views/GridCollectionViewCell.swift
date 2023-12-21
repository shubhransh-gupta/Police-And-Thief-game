//
//  GridCollectionViewCell.swift
//  GhostAndPolice
//
//  Created by Shubhransh Gupta on 21/12/23.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.image = UIImage()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }

}
