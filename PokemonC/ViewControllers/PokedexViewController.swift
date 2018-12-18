//
//  PokedexViewController.swift
//  PokemonC
//
//  Created by Greg Hughes on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var attacksLabel: UILabel!
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    
    
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonSearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
}


// MARK: - SeachBar Delegate
extension PokedexViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchText = pokemonSearchBar.text ?? ""
        
        DVMPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            
            guard let pokemon = pokemon else {return}
            
            DVMPokemonController.fetchPokemonImage(pokemon, completion: { (image) in
                
                guard let image = image else {return}
            
            
            DispatchQueue.main.async {
                
                self.spriteImageView.image = image
                self.nameLabel.text = pokemon.name.capitalized
                self.attacksLabel.text = pokemon.abilities.joined(separator:", ")
                self.idLabel.text = "\(pokemon.identifier)"
                
                }
            })
        }
    }
}
