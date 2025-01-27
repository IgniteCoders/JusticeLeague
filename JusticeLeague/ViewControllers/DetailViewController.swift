//
//  DetailViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    
    @IBOutlet weak var intelligenceProgressView: UIProgressView!
    @IBOutlet weak var strengthProgressView: UIProgressView!
    @IBOutlet weak var speedProgressView: UIProgressView!
    @IBOutlet weak var durabilityProgressView: UIProgressView!
    @IBOutlet weak var powerProgressView: UIProgressView!
    @IBOutlet weak var combatProgressView: UIProgressView!
    
    var superhero: Superhero!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = superhero.name
        nameLabel.text = superhero.name
        avatarImageView.loadFrom(url: superhero.image.url)
        
        avatarImageView.roundCorners(radius: 24, maskToBounds: false)
        avatarImageView.setShadow()
        
        // Biography
        realNameLabel.text = superhero.biography.realName
        publisherLabel.text = superhero.biography.publisher
        placeOfBirthLabel.text = superhero.biography.placeOfBirth
        //alignmentLabel.text = superhero.biography.alignment.uppercased()
        if (superhero.biography.alignment == "good") {
            alignmentLabel.textColor = UIColor.systemGreen
            alignmentLabel.text = String(localized: "alignment_good")
        } else if (superhero.biography.alignment == "bad") {
            alignmentLabel.textColor = UIColor.systemRed
            alignmentLabel.text = String(localized: "alignment_evil")
        } else {
            alignmentLabel.textColor = UIColor.systemGray
            alignmentLabel.text = String(localized: "alignment_neutral")
        }
        
        // Stats
        intelligenceLabel.text = superhero.powerstats.intelligence
        strengthLabel.text = superhero.powerstats.strength
        speedLabel.text = superhero.powerstats.speed
        durabilityLabel.text = superhero.powerstats.durability
        powerLabel.text = superhero.powerstats.power
        combatLabel.text = superhero.powerstats.combat
        
        intelligenceProgressView.progress = (Float(superhero.powerstats.intelligence) ?? 0.0) / 100
        strengthProgressView.progress = (Float(superhero.powerstats.strength) ?? 0.0) / 100
        speedProgressView.progress = (Float(superhero.powerstats.speed) ?? 0.0) / 100
        durabilityProgressView.progress = (Float(superhero.powerstats.durability) ?? 0.0) / 100
        powerProgressView.progress = (Float(superhero.powerstats.power) ?? 0.0) / 100
        combatProgressView.progress = (Float(superhero.powerstats.combat) ?? 0.0) / 100
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        // create the alert
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.actionSheet)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
