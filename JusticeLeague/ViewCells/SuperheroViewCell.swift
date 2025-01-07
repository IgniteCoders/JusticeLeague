//
//  SuperheroViewCell.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class SuperheroViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.roundCorners(radius: 16)
        
        shadowView.roundCorners(radius: 16, maskToBounds: false)
        
        shadowView.setShadow()
    }
    
    func render(superhero: Superhero) {
        nameLabel.text = superhero.name
        avatarImageView.loadFrom(url: superhero.image.url)
    }
}
