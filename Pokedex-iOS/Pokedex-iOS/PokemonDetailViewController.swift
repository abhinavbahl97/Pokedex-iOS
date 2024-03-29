//
//  PokemonDetailViewController.swift
//  Pokedex-iOS
//
//  Created by Abhinav Bahl on 12/10/18.
//  Copyright © 2018 Abhinav Bahl. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var currentPokeImageView: UIImageView!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        nameLbl.text = pokemon.name
        mainImageView.image = UIImage(named: "\(pokemon.pokedexId)" )
        currentPokeImageView.image = UIImage(named: "\(pokemon.pokedexId)" )
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUI() {
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
    }

    @IBAction func onBackPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
