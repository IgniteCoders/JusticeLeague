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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func render(superhero: Superhero) {
        nameLabel.text = superhero.name
        avatarImageView.loadFrom(url: superhero.image.url)
    }
}
