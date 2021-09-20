//
//  CollectionCell.swift
//  ImageCarousel-Example
//
//  Created by Belal Samy on 20/09/2021.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie? {
            didSet {
                posterImageView.image = movie?.posterImage
            }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.contentMode = .scaleAspectFill
        
    }

}
