//
//  ViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        Task {
            do {
                list = try await SuperheroProvider.findSuperheroesBy(name: "a")
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SuperheroViewCell
        cell.nameLabel.text = list[indexPath.item].name
        return cell
    }
}

