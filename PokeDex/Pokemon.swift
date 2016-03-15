//
//  Pokemon.swift
//  PokeDex
//
//  Created by Emanuel  Guerrero on 3/15/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}