//
//  TransactionTableViewCell.swift
//  Plutus
//
//  Created by Tushar Singh on 09/08/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var tickerImage: UIImageView!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var balanceLabe: UILabel!
    @IBOutlet weak var message: UILabel!
    
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
