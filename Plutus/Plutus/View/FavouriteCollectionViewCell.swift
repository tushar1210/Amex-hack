//
//  FavouriteCollectionViewCell.swift
//  Plutus
//
//  Created by Tushar Singh on 09/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var tickerImageView: UIImageView!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    
    }

    @IBAction func go(_ sender: Any) {
        if go.backgroundImage(for: .normal) == UIImage(named: "fav"){
            go.setBackgroundImage(UIImage(named: "unfav"), for: .normal)
        }else{
            go.setBackgroundImage(UIImage(named: "fav"), for: .normal)
        }
    }
    
}
