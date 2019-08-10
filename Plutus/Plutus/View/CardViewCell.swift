//
//  CardViewCell.swift
//  
//
//  Created by Tushar Singh on 08/08/19.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var deposit: UIButton!
    @IBOutlet weak var withdraw: UIButton!
    
    override func awakeFromNib() {
        //self.contentView.backgroundColor = .black
        self.backgroundColor = .clear
		self.backgroundView?.backgroundColor = .clear
        self.layer.cornerRadius = 14
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
    	self.deposit.layer.cornerRadius = 3
		self.withdraw.layer.cornerRadius = 3
		setGradientBackground()
    }
	func setGradientBackground() {
		let gradientColor1 = UIColor(red: 10/255, green: 111/255, blue: 206/255, alpha: 1).cgColor
		let gradientColor2 = UIColor(red: 99/255, green: 173/255, blue: 242/255, alpha: 1).cgColor
		
		let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
		let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
		
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [gradientColor2, gradientColor1]
		gradientLayer.locations = [0, 1]
		gradientLayer.startPoint = CGPoint(x:0,y:0.5)
		gradientLayer.endPoint = CGPoint(x:1,y:0.5)
		gradientLayer.frame = self.contentView.bounds
		
		self.contentView.layer.insertSublayer(gradientLayer, at:0)
	}
    @IBAction func withdraw(_ sender: Any) {
        
    }
    
    @IBAction func deposit(_ sender: Any) {
        
        
    }
}

extension UIColor {
	public convenience init?(hex: String) {
		let r, g, b, a: CGFloat
		
		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			let hexColor = String(hex[start...])
			
			if hexColor.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, alpha: a)
					return
				}
			}
		}
		
		return nil
	}
}

//let gold = UIColor(hex: "#ffe700ff")
