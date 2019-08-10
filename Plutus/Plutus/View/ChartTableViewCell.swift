//
//  ChartTableViewCell.swift
//  Plutus
//
//  Created by Tushar Singh on 08/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class ChartTableViewCell: UITableViewCell {

    @IBOutlet weak var stockImageView: UIImageView!
    @IBOutlet weak var stockTickLabel: UILabel!
    @IBOutlet weak var stockHoldLabel: UILabel!
    @IBOutlet weak var stockCurrencyLabel: UILabel!
    @IBOutlet weak var stockStatusImage: UIImageView!
    @IBOutlet weak var stockNetLabel: UILabel!
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var stockPriceLabel: UILabel!
    
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        contentView.addShadow()
        shadowView.layer.cornerRadius = 14
        shadowView.layer.borderWidth = 1.0
        shadowView.layer.borderColor = UIColor.clear.cgColor
        shadowView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}
