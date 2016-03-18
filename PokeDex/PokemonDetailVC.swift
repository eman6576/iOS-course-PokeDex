//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Emanuel  Guerrero on 3/16/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var currentEvoImageView: UIImageView!
    @IBOutlet weak var nextEvoImageView: UIImageView!
    @IBOutlet weak var evolutionLabel: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalizedString
        
        let image = UIImage(named: "\(pokemon.pokedexID)")
        mainImageView.image = image
        currentEvoImageView.image = image
        
        pokemon.downloadPokemonDetails { () -> () in
            //This will be called after download is done
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        pokedexLabel.text = "\(pokemon.pokedexID)"
        weightLabel.text = pokemon.weight
        baseAttackLabel.text = pokemon.attack
        
        if pokemon.nextEvolutionID == "" {
            evolutionLabel.text = "No Evolutions"
            nextEvoImageView.hidden = true
        } else {
            nextEvoImageView.hidden = false
            nextEvoImageView.image = UIImage(named: pokemon.nextEvolutionID)
            
            var tempString = "Next Evolution: \(pokemon.nextEvolutionText)"
            if pokemon.nextEvolutionLevel != "" {
                tempString += " - LVL \(pokemon.nextEvolutionLevel)"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
