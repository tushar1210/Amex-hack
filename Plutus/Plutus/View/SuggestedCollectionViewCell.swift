//
//  SuggestedCollectionViewCell.swift
//  Plutus
//
//  Created by Tushar Singh on 09/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class SuggestedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var tickerImageView: UIImageView!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    
    
    override func awakeFromNib() {
        
    }
    
    
    @IBAction func favButton(_ sender: Any) {
        if favButton.backgroundImage(for: .normal) == UIImage(named: "fav"){
            favButton.setBackgroundImage(UIImage(named: "unfav"), for: .normal)
        }else{
            favButton.setBackgroundImage(UIImage(named: "fav"), for: .normal)
        }
    }
}
