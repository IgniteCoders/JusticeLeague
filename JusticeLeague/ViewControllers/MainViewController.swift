//
//  ViewController.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        findSuperheroBy(name: "a")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SuperheroViewCell
        let superhero = list[indexPath.item]
        cell.render(superhero: superhero)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns = 3
        let spacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
        let screenWidth = collectionView.frame.size.width
        let leftSpace = screenWidth - spacing * CGFloat(columns - 1)
        let width = leftSpace / CGFloat(columns) //some width
        let height = width * 1.25 //ratio
        return CGSize(width: width, height: height)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            findSuperheroBy(name: query)
        } else {
            findSuperheroBy(name: "a")
        }
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let superhero = list[indexPath.row]
        detailViewController.superhero = superhero
        tableView.deselectRow(at: indexPath, animated: true)
    }*/
    
    func findSuperheroBy(name: String) {
        Task {
            do {
                list = try await SuperheroProvider.findSuperheroesBy(name: name)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}

