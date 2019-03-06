//
//  Pokemon.swift
//  Pokedex-iOS
//
//  Created by Abhinav Bahl on 12/10/18.
//  Copyright © 2018 Abhinav Bahl. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _pokemonURL: String!
    
    init(name: String, pokedexId: Int, height: String, weight: String, attack: String) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        self._height = height
        self._weight = weight
        self._attack = attack
    }
    
    var name: String {
        if _name == nil {
            return ""
        }
        
        return _name
    }
    
    var pokedexId: Int{
        if _pokedexId == nil {
            return 1
        }
        
        return _pokedexId
    }
    
    var type: String {
        if _type == nil {
            return ""
        }
        
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            return ""
        }
        
        return _defense
    }
    
    var height: String {
        if _height == nil {
            return ""
        }
        
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            return ""
        }
        
        return _weight
    }
    
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(self._pokemonURL, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self._weight = json["weight"].stringValue
                self._height = json["height"].stringValue
                self._defense = json["base_experience"].stringValue
                
                let jsonTypes = json["types"]
                let typeName = jsonTypes[0]["type"]["name"].stringValue
                self._type = typeName.capitalized
                
                completed()
            case .failure( _):
                print("Failed To Retrieve")
            }
        }
    }
    
}
